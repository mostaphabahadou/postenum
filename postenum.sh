#!/bin/bash
# License: MIT
set -o emacs  # Enable readline support
# variables for colors
white=$'\e[0m'
blu=$'\e[0;94m'
boldgrn=$'\e[1;92m'
yellowintensy=$'\e[0;93m'
grnintensy=$'\e[0;92m'
whiteboldintensy=$'\e[1;97m'
redintensy=$'\e[0;91m'
redbold=$'\e[2;31m'

banner () {
	echo "

 ██▓███   ▒█████    ██████ ▄▄▄█████▓▓█████  ███▄    █  █    ██  ███▄ ▄███▓
▓██░  ██▒▒██▒  ██▒▒██    ▒ ▓  ██▒ ▓▒▓█   ▀  ██ ▀█   █  ██  ▓██▒▓██▒▀█▀ ██▒
▓██░ ██▓▒▒██░  ██▒░ ▓██▄   ▒ ▓██░ ▒░▒███   ▓██  ▀█ ██▒▓██  ▒██░▓██    ▓██░
▒██▄█▓▒ ▒▒██   ██░  ▒   ██▒░ ▓██▓ ░ ▒▓█  ▄ ▓██▒  ▐▌██▒▓▓█  ░██░▒██    ▒██ 
▒██▒ ░  ░░ ████▓▒░▒██████▒▒  ▒██▒ ░ ░▒████▒▒██░   ▓██░▒▒█████▓ ▒██▒   ░██▒
▒▓▒░ ░  ░░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░  ▒ ░░   ░░ ▒░ ░░ ▒░   ▒ ▒ ░▒▓▒ ▒ ▒ ░ ▒░   ░  ░
░▒ ░       ░ ▒ ▒░ ░ ░▒  ░ ░    ░     ░ ░  ░░ ░░   ░ ▒░░░▒░ ░ ░ ░  ░      ░
░░       ░ ░ ░ ▒  ░  ░  ░    ░         ░      ░   ░ ░  ░░░ ░ ░ ░      ░   
             ░ ░        ░              ░  ░         ░    ░            ░   
                                                                          
 
@mostaphabahadou
version: 2.0                                                                        
	"
	echo ""
	echo "Welcome to Postenum. Type 'help' for available commands."
}

# =========================
# Global Variables
# =========================
CURRENT_MODULE=""
CURRENT_VERSION="2.0"
declare -A MODULE_DESCRIPTIONS  # Associative array for module descriptions
history=()    # Array to store executed commands
history_index=0  # Index to track current position in history
current_input=""  # Store current input temporarily

function DirtyCow(){
	echo $redintensy"Linux Kernel 2.6.22 < 3.9 Dirty Cow$white - https://www.exploit-db.com/exploits/40839"
	echo $redintensy"Linux Kernel 2.6.22 < 3.9 Dirty Cow (x86-x64)$white - https://www.exploit-db.com/exploits/40616"
}

function Exploits1x(){
	echo $redintensy"Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
	echo $redintensy"Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
	echo $redintensy"Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
	echo $redintensy"Linux Kernel < 4.4.0-21 (Ubuntu 16.04 x64) - 'netfilter target_offset'$white - https://www.exploit-db.com/exploits/44300"
	echo $redintensy"Linux Kernel < 3.5.0-23 (Ubuntu 12.04.2 x64) - 'SOCK_DIAG' SMEP Bypass$white - https://www.exploit-db.com/exploits/44299"
}

function Exploits2x(){
	echo $redintensy"Linux Kernel 2.4.x/2.6.x$white - https://www.exploit-db.com/exploits/9545"
	echo $redintensy"UDEV < 1.4.1 (1)$white - https://www.exploit-db.com/exploits/8478"
	echo $redintensy"UDEV < 1.4.1 (2)$white - https://www.exploit-db.com/exploits/8572"
	echo $redintensy"UDEV < 1.4.1 (Metasploit)$white - https://www.exploit-db.com/exploits/21848"	
	echo $redintensy"Linux Kernel 2.6 < 2.6.19$white - https://www.exploit-db.com/exploits/9542"
	echo $redintensy"Linux Kernel 2.6.0 < 2.6.31(1)$white - https://www.exploit-db.com/exploits/33321"
	echo $redintensy"Linux Kernel 2.6.x (2)$white - https://www.exploit-db.com/exploits/33322"
	echo $redintensy"Linux Kernel 2.6.x$white - https://www.exploit-db.com/exploits/30604"
	echo $redintensy"Linux Kernel 2.6.39 < 3.2.2 Gentoo / Ubuntu x86-x64 Mempodipper(1)$white - https://www.exploit-db.com/exploits/18411"
	echo $redintensy"Linux Kernel 2.6.39 < 3.2.2 x86-x64 Mempodipper(2)$white - https://www.exploit-db.com/exploits/35161"
	echo $redintensy"Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
	echo $redintensy"Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
	echo $redintensy"Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
	echo $redintensy"Linux Kernel < 4.4.0-21 (Ubuntu 16.04 x64) - 'netfilter target_offset'$white - https://www.exploit-db.com/exploits/44300"
	echo $redintensy"Linux Kernel < 3.5.0-23 (Ubuntu 12.04.2 x64) - 'SOCK_DIAG' SMEP Bypass$white - https://www.exploit-db.com/exploits/44299"
}

function Exploits3x(){
	echo $redintensy"Linux Kernel 2.6.39 < 3.2.2 Gentoo / Ubuntu x86-x64 Mempodipper(1)$white - https://www.exploit-db.com/exploits/18411"
	echo $redintensy"Linux Kernel 2.6.39 < 3.2.2 x86-x64 Mempodipper(2)$white - https://www.exploit-db.com/exploits/35161"
	echo $redintensy"Linux Kernel 3.7.6 (RedHat x86/x64)$white - https://www.exploit-db.com/exploits/27297"
	echo $redintensy"Linux Kernel 3.13 < 3.19 Ubuntu 12.04/14.04/14.10/15.04$white - https://www.exploit-db.com/exploits/37292"
	echo $redintensy"Linux Kernel 3.13 SGID$white - https://www.exploit-db.com/exploits/33824"
	echo $redintensy"Linux Kernel 3.13.1 (Metasploit)$white - https://www.exploit-db.com/exploits/40503"
	echo $redintensy"Linux Kernel 3.14.5 (CentOS 7 / RHEL)$white - https://www.exploit-db.com/exploits/35370"
	echo $redintensy"Linux Kernel 3.x (Ubuntu 14.04/Mint 17.3/Fedora 22)$white https://www.exploit-db.com/exploits/41999"
	echo $redintensy"Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
	echo $redintensy"Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
	echo $redintensy"Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
	echo $redintensy"Linux Kernel < 4.4.0-21 (Ubuntu 16.04 x64) - 'netfilter target_offset'$white - https://www.exploit-db.com/exploits/44300"
	echo $redintensy"Linux Kernel < 3.5.0-23 (Ubuntu 12.04.2 x64) - 'SOCK_DIAG' SMEP Bypass$white - https://www.exploit-db.com/exploits/44299"
}

function Exploits4x(){
	echo $redintensy"Linux Kernel 4.3.3 Overlayfs$white - https://www.exploit-db.com/exploits/39230"
	echo $redintensy"Linux Kernel 4.3.3 (Ubuntu 14.04/15.10)$white - https://www.exploit-db.com/exploits/39166"
	echo $redintensy"Linux Kernel 4.4.0 (Ubuntu 14.04/16.04 x86-64)$white - https://www.exploit-db.com/exploits/40871"
	echo $redintensy"Linux Kernel 4.4.0-21 < 4.4.0-51 (Ubuntu 14.04/16.04 x86-64)$white - https://www.exploit-db.com/exploits/47170"
	echo $redintensy"Linux Kernel < 4.4.0-83 / < 4.8.0-58 (Ubuntu 14.04/16.04)$white - https://www.exploit-db.com/exploits/43418"
	echo $redintensy"Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
	echo $redintensy"Linux Kernel 4.4.1$white - https://www.exploit-db.com/exploits/40003"
	echo $redintensy"Linux Kernel 4.8.0 (UDEV < 232) - https://www.exploit-db.com/exploits/41886"
	echo $redintensy"Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
	echo $redintensy"Linux Kernel 4.13 (Debian 9)$white - https://www.exploit-db.com/exploits/44303"
	echo $redintensy"Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
	echo $redintensy"Linux Kernel 4.14.0-rc4+$white - https://www.exploit-db.com/exploits/43029"
	echo $redintensy"Linux Kernel 4.15.x < 4.19.2 (polkit Method)$white - https://www.exploit-db.com/exploits/47167"
	echo $redintensy"Linux Kernel 4.15.x < 4.19.2 (cron Method)$white - https://www.exploit-db.com/exploits/47164"
	echo $redintensy"Linux Kernel 4.10 < 5.1.17$white - https://www.exploit-db.com/exploits/47163"
	echo $redintensy"Linux Kernel < 4.4.0-21 (Ubuntu 16.04 x64) - 'netfilter target_offset'$white - https://www.exploit-db.com/exploits/44300"
	echo $redintensy"Linux Kernel 4.13 (Ubuntu 17.10) - 'waitid()' SMEP/SMAP/Chrome Sandbox$white - https://www.exploit-db.com/exploits/43127"
	echo $redintensy"Linux Kernel < 4.4.0/ < 4.8.0 (Ubuntu 14.04/16.04 / Linux Mint 17/18 / Zorin) - Local Privilege Escalation (KASLR / SMEP)$white - https://www.exploit-db.com/exploits/47169"
	echo $redintensy"Linux Kernel 4.8.0-34 < 4.8.0-45 (Ubuntu / Linux Mint) - Packet Socket Local Privilege Escalation$white - https://www.exploit-db.com/exploits/47168"
	echo $redintensy"Linux Kernel 4.4 (Ubuntu 16.04) - 'snd_timer_user_ccallback()' Kernel Pointer Leak$white - https://www.exploit-db.com/exploits/46529"
}

function Exploits5-6x(){
	echo $redintensy"Linux Kernel 4.10 < 5.1.17$white - https://www.exploit-db.com/exploits/47163"
	echo $redintensy"Linux 5.3$white - https://www.exploit-db.com/exploits/47779"
	echo $redintensy"Linux 5.3 - Privilege Escalation via io_uring Offload of sendmsg() onto Kernel Thread with Kernel Creds$white - https://www.exploit-db.com/exploits/47779"
	echo $redintensy"Linux Kernel 5.1.x - 'PTRACE_TRACEME' pkexec LPE$white - https://www.exploit-db.com/exploits/50541"
	echo $redintensy"Linux Kernel 2.6.19 < 5.9 - 'Netfilter Local Privilege Escalation$white - https://www.exploit-db.com/exploits/50135"
	echo $redintensy"Linux Kernel 6.2 - Userspace Processes To Enable Mitigation$white - https://www.exploit-db.com/exploits/51384"
	echo $redintensy"Linux Kernel 5.8 < 5.16.11 - Local Privilege Escalation (DirtyPipe)$white - https://www.exploit-db.com/exploits/50808"
	echo $redintensy"Linux Kernel 5.14 < 6.6 - Universal Local Privilege Escalation$white - https://github.com/Notselwyn/CVE-2024-1086"
	echo $redintensy"Ubuntu 23.04 (Lunar Lobster)|Ubuntu 22.10 (Kinetic Kudu)|Ubuntu 22.04 LTS (Jammy Jellyfish)|Ubuntu 20.04 LTS (Focal Fossa)|Ubuntu 18.04 LTS (Bionic Beaver)| Local Privilege Escalation$white - https://www.wiz.io/blog/ubuntu-overlayfs-vulnerability"
}

function OperatingSystem(){
	echo $boldgrn"[-] THE OPERATING SYSTEM"$white
	ID=$(id 2>/dev/null)
	if [ "$ID" ]; then
		echo $yellowintensy"[+] The current user and group membership:"$white
		echo -e "$ID\n"
	fi

	WHOAMI=$(whoami 2>/dev/null)
	if [ "$WHOAMI" ]; then
		echo $yellowintensy"[+] The current user:"$white
		echo -e "$WHOAMI\n"
	fi

	RELEASE=$(cat /etc/*-release 2>/dev/null)
	if [ "$RELEASE" ]; then
		echo $yellowintensy"[+] The distribution type and version:"$white
		echo -e "$RELEASE\n"
	fi 

	CPUINFO=$(lscpu 2>/dev/null)
	if [ "$CPUINFO" ]; then
		echo $yellowintensy"[+] CPU architecture information from sysfs and /proc/cpuinfo:"$white
		echo -e "$CPUINFO\n"
	fi
	
	UNAME=$(uname -a 2>/dev/null)
	if [ "$UNAME" ]; then
		echo $yellowintensy"[+] The kernel:"$white
		echo -e "$UNAME\n"
	fi

	PROCVERSION=$(cat /proc/version 2>/dev/null)
	if [ "$PROCVERSION" ]; then
		echo $yellowintensy"[+] The GCC compiler:"$white
		echo -e "$PROCVERSION\n"
	fi

	LSBLK=$(lsblk 2>/dev/null)
	if [ "$LSBLK" ]; then
		echo $yellowintensy"[+] Mounted partitions:"$white
		echo -e "$LSBLK\n"
	fi
}

function KernelExploits(){
	echo $boldgrn"[-] KERNEL/DISTRIBUTION EXPLOITS"$white
	underversion2=2.0.0
	kernel=$(uname -a | cut -d " " -f "3" | cut -d "-" -f "1")
	OPERATOR=$(echo "$kernel $underversion2" | awk '{if ($1 < $2) print "2"; else print "3"}')
	if [ "$OPERATOR" == "2" ]; then
		echo $yellowintensy"[+] Possible exploits for linux kernel $kernel:"$white
		Exploits1x
		echo ""
		echo $yellowintensy"[+] The most specific exploits for your kernel $kernel"$white
		Exploits1x > exploits1.txt
		minimumsize=42
		actualsize=$(wc -c exploits1.txt|cut -d " " -f 1)
		if [ "$actualsize" -ge "$minimumsize" ]; then
			grep "$kernel" exploits1.txt > exploit.txt
			shred -n 5 -u -z exploits1.txt
			exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
			if [ "$exploitfilesize" -ge "$minimumsize" ]; then
				cat exploit.txt
				shred -n 5 -u -z exploit.txt
			else
				echo "No accurate exploit for kernel $kernel - use manual approaches (Google, Searchsploit)"
			fi
		else
			echo "Found nothing! Be persistent."
		fi
	else
		underversion3=3.0.0
		OPERATOR=$(echo "$kernel $underversion3" | awk '{if ($1 < $2) print "3"; else print "4"}')
		if [ "$OPERATOR" == "3" ]; then
			echo $yellowintensy"[+] Possible exploits for linux kernel $kernel:"$white
			Exploits3x
			DirtyCow
			echo ""
			echo $yellowintensy"[+] The most specific exploits for your kernel $kernel"$white
			Exploits3x > exploits2.txt
			DirtyCow >> exploits2.txt
			minimumsize=42
			actualsize=$(wc -c exploits2.txt|cut -d " " -f 1)
			if [ "$actualsize" -ge "$minimumsize" ]; then
				grep "$kernel" exploits2.txt > exploit.txt
				shred -n 5 -u -z exploits2.txt
				exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
				if [ "$exploitfilesize" -ge "$minimumsize" ]; then
					cat exploit.txt
					shred -n 5 -u -z exploit.txt
				else
					echo "No accurate exploit for kernel $kernel - use manual approaches (Google, Searchsploit)"
				fi
			else
				echo "Nothing here! But don't give up."
			fi
		else
			underversion4=4.0.0
			OPERATOR=$(echo "$kernel $underversion4" | awk '{if ($1 < $2) print "4"; else print "5"}')
			if [ "$OPERATOR" == "4" ]; then
				echo $yellowintensy"[+] Possible exploits for linux kernel $kernel:"$white
				Exploits3x
				DirtyCow
				echo ""
				echo $yellowintensy"[+] The most specific exploits for your kernel $kernel"$white
				Exploits3x > exploits3.txt
				DirtyCow >> exploits3.txt
				minimumsize=42
				actualsize=$(wc -c exploits3.txt|cut -d " " -f 1)
				if [ "$actualsize" -ge "$minimumsize" ]; then
					grep "$kernel" exploits3.txt > exploit.txt
					shred -n 5 -u -z exploits3.txt
					exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
					if [ "$exploitfilesize" -ge "$minimumsize" ]; then
						cat exploit.txt
						shred -n 5 -u -z exploit.txt
					else
						echo "No accurate exploit for kernel $kernel - use manual approaches (Google, Searchsploit)"
					fi
				else
					echo "Found nothing! Be persistent."
				fi
			else
				underversion5=5.0.0
				OPERATOR=$(echo "$kernel $underversion5" | awk '{if ($1 < $2) print "5"; else print "6"}')
				if [ "$OPERATOR" == "5" ]; then
					echo $yellowintensy"[+] Possible exploits for linux kernel $kernel:"$white
					Exploits4x
					echo ""
					echo $yellowintensy"[+] The most specific exploits for your kernel $kernel"$white
					Exploits4x > exploits4.txt
					minimumsize=42
					actualsize=$(wc -c exploits4.txt|cut -d " " -f 1)
					if [ "$actualsize" -ge "$minimumsize" ]; then
						grep "$kernel" exploits4.txt > exploit.txt
						shred -n 5 -u -z exploits4.txt
						exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
						if [ "$exploitfilesize" -ge "$minimumsize" ]; then
							cat exploit.txt
							shred -n 5 -u -z exploit.txt
						else
							echo "No accurate exploit for kernel $kernel - use manual approaches (Google, Searchsploit)"
						fi
					else
						echo "Found nothing! Be persistent."
					fi
				else
					underversion6=7.0.0
					OPERATOR=$(echo "$kernel $underversion6" | awk '{if ($1 < $2) print "6"; else print "7"}')
					if [ "$OPERATOR" == "6" ]; then
						echo $yellowintensy"[+] Possible exploits for linux kernel $kernel:"$white
						Exploits5-6x
						echo ""
						echo $yellowintensy"[+] The most specific exploits for your kernel $kernel"$white
						Exploits5-6x > exploits5.txt
						minimumsize=42
						actualsize=$(wc -c exploits5.txt|cut -d " " -f 1)
						if [ "$actualsize" -ge "$minimumsize" ]; then
							grep "$kernel" exploits5.txt > exploit.txt
							shred -n 5 -u -z exploits5.txt
							exploitfilesize=$(wc -c exploit.txt|cut -d " " -f 1)
							if [ "$exploitfilesize" -ge "$minimumsize" ]; then
								cat exploit.txt
								shred -n 5 -u -z exploit.txt
							else
								echo "No accurate exploit for kernel $kernel - use manual approaches (Google, Searchsploit)"
							fi
						else
							echo "Found nothing! Be persistent."
						fi
					else
						echo $yellowintensy"[+] Possible exploits for linux kernel $kernel:"$white
						echo "Nothing in our database on kernel $kernel. Use search engines for more information."
					fi
				fi
			fi
		fi
	fi
	echo ""
}

function AppsAndServices(){
	echo $boldgrn"[-] APPS and SERVICES"$white
	CRON=$(for x in "/etc"; do ls -l "$x"; done | grep cron 2>/dev/null)
	if [ "$CRON" ]; then
		echo $yellowintensy"[+] Search on cron in /etc:"$white
		echo -e "$CRON\n"
	fi

	CRONWRASROOT=$(find /etc/cron* -type f -perm -o+w -exec ls -l {} \; 2>/dev/null)
	if [ "$CRONWRASROOT" ]; then
		echo $yellowintensy"[+] Custom jobs or tasks configured as root and are world-writeable:"$white
		echo -e $redintensy"$CRONWRASROOT\n"$white
	fi

	CROND=$(for x in "/etc/cron.d/"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CROND"  ]; then
		echo $yellowintensy"[+] List /etc/cron.d/:"$white
		echo -e "$CROND\n"
	else
		CRONDTAB=$(crontab -l 2>/dev/null)
		if [ "$CRONDTAB" ]; then
			echo $yellowintensy"[+] Root's cron jobs:"$white
			echo -e "$CRONDTAB\n"
		fi	
	fi

	CRONTAB=$(cat /etc/crontab 2>/dev/null)
	if [ "$CRONTAB"  ]; then
		echo $yellowintensy"[+] The content of /etc/crontab:"$white
		echo -e "$CRONTAB\n"
	fi

	CRONDAILY=$(for x in "/etc/cron.daily"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CRONDAILY" ]; then
		echo $yellowintensy"[+] View daily cron jobs:"$white
		echo -e "$CRONDAILY\n"
	fi

	CRONDHOURLY=$(for x in "/etc/cron.hourly"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CRONDHOURLY" ]; then
		echo $yellowintensy"[+] View hourly cron jobs:"$white
		echo -e "$CRONDHOURLY\n"
	fi 

	CRONDMONTHLY=$(for x in "/etc/cron.monthly"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CRONDMONTHLY" ]; then
		echo $yellowintensy"[+] View monthly cron jobs:"$white
		echo -e "$CRONDMONTHLY\n"
	fi 

	CRONDWEEKLY=$(for x in "/etc/cron.weekly"; do ls -l "$x"; done | grep -v "total " 2>/dev/null)
	if [ "$CRONDWEEKLY" ]; then
		echo $yellowintensy"[+] View weekly cron jobs:"$white
		echo -e "$CRONDWEEKLY\n"
	fi 

	WRITEABLECRONJOB=$(find /etc/cron* -type f -perm -o+w -exec ls -l {} \;)
	if [ "$WRITEABLECRONJOB" ]; then
		echo $yellowintensy"[+] Find world-writeable cron jobs:"$white
		echo -e "$WRITEABLECRONJOB\n"
	fi 

	AUX=$(ps aux 2>/dev/null)
	if [ "$AUX" ]; then
		echo $yellowintensy"[+] Display every process on the system:"$white
		echo -e "$AUX\n"
	fi

	PROCESSBINARY=$(ps aux | awk '{print $11}'| xargs -r ls -la 2>/dev/null | awk '!x[$0]++' 2>/dev/null)
	if [ "$PROCESSBINARY" ]; then
		echo $yellowintensy"[+] Process binaries and permissions:"$white
  		echo -e "$PROCESSBINARY\n"
  	fi

	AUXROOT=$(ps aux | grep root 2>/dev/null)
	if [ "$AUXROOT" ]; then
		echo $yellowintensy"[+] Display every process running by root on the system:"$white
		echo -e "$AUXROOT\n"
	fi

	MYSQL=$(ps aux | grep mysql 2>/dev/null)
	if [ "$MYSQL" ]; then
		echo $yellowintensy"[+] MySQL running as root:"$white
		echo -e $redintensy"$MYSQL\n"$white
	fi
}

function CommAndNet(){
	echo $boldgrn"[-] COMMUNICATING and NETWORKING"$white	
	IFCONFIG=$(ifconfig -a 2>/dev/null)
	if [ "$IFCONFIG" ]; then
		echo $yellowintensy"[+] Display all interfaces which are currently available:"$white
		echo -e "$IFCONFIG\n"
	fi

	INTERFACE=$(cat /etc/network/interfaces 2>/dev/null)
	if [ "$INTERFACE" ]; then
		echo $yellowintensy"[+] Available network interfaces on the system:"$white
		echo -e "$INTERFACE\n"
	fi

	HOST=$(cat /etc/hosts 2>/dev/null)
	if [ "$HOST" ]; then
		echo $yellowintensy"[+] Local 'hosts' file:"$white
		echo -e "$HOST\n"
	fi

	RESOLV=$(cat /etc/resolv.conf 2>/dev/null)
	if [ "$RESOLV" ]; then
		echo $yellowintensy"[+] DNS name servers:"$white
		echo -e "$RESOLV\n"
	fi

	NETWORK=$(cat /etc/networks 2>/dev/null)
	if [ "$NETWORK" ]; then
		echo $yellowintensy"[+] Local 'networks' file:"$white
		echo -e "$NETWORK\n"
	fi

	SELinux=$(sestatus 2>/dev/null)
	if [ "$SELinux" ]; then
		echo $yellowintensy"[+] SELinux enabled - status:"$white
		echo -e "$SELinux\n"
	fi
	
	Execshield=$(grep "exec-shield" /etc/sysctl.conf)
	if [ "$Execshield" ]; then
		echo $yellowintensy"[+] Execshield enabled:"$white
		echo -e "$Execshield\n"
	fi

	IPTABLE=$(iptables -L 2>/dev/null)
	if [ "$IPTABLE" ]; then
		echo $yellowintensy"[+] Packet filter rules:"$white
		echo -e "$IPTABLE\n"
	fi

	HOSTNAME=$(hostname 2>/dev/null)
	if [ "$HOSTNAME" ]; then
		echo $yellowintensy"[+] hostname:"$white
		echo -e "$HOSTNAME\n"
	fi

	DNS=$(dnsdomainname 2>/dev/null)
	if [ "$DNS" ]; then
		echo $yellowintensy"[+] Get DNS domain or the FQDN:"$white
		echo -e "$DNS\n"
	fi
	
	NETSTAT=$(netstat -antup 2>/dev/null)
	if [ "$NETSTAT" ]; then
		echo $yellowintensy"[+] Display all TCP/UDP connected sockets and PID/program:"$white
		echo -e "$NETSTAT\n"
	else
		#alternative to netstat
		SS=$(ss -tuln 2>/dev/null)
		if [ "$SS" ]; then
			echo $yellowintensy"[+] Display all TCP/UDP sockets:"$white
			echo -e "$SS\n"
		fi
	fi

	LSOF=$(lsof -Pi 2>/dev/null)
	if [ "$LSOF" ]; then
		echo $yellowintensy"[+] List files based on their internet address:"$white
		echo -e "$LSOF\n"
	fi

	LAST=$(last -a 2>/dev/null)
	if [ "$LAST" ]; then
		echo $yellowintensy"[+] Last logged on users:"$white
		echo -e "$LAST\n"
	fi

	LASTLOG=$(lastlog 2>/dev/null)
	if [ "$LASTLOG" ]; then
		echo $yellowintensy"[+] Recent logins:"$white
		echo -e "$LASTLOG\n"
	fi

	W=$(w 2>/dev/null)
	if [ "$W" ]; then
		echo $yellowintensy"[+] Who is currently logged onto the system:"$white
		echo -e "$W\n"
	fi

	ARP=$(arp -a 2>/dev/null)
	if [ "$ARP" ]; then
		echo $yellowintensy"[+] Display all hosts based on ARP:"$white
		echo -e "$ARP\n"
	fi

	ROUTE=$(route -nee 2>/dev/null)
	if [ "$ROUTE" ]; then
		echo $yellowintensy"[+] Display IP routing table:"$white
		echo -e "$ROUTE\n" 
	fi
}

function ConfidentialInfoAndUser(){
	echo $boldgrn"[-] CONFIDENTIAL INFO and USER"$white
	SUPERUSER1=$(awk -F: '($3 == "0") {print}' /etc/passwd 2>/dev/null)
	SUPERUSER2=$(grep -v -E "^#" /etc/passwd 2>/dev/null | awk -F: '$3 ==0 { print $1}' 2>/dev/null)
	if [ "$SUPERUSER1" ] || [ "$SUPERUSER2" ]; then
		echo $yellowintensy"[+] Super user:"$white
		echo "$SUPERUSER1"; echo "$SUPERUSER2"
		echo ""
	fi

	HOMEUSERS=$(ls -ld /home/* 2>/dev/null)
	if [ "$HOMEUSERS" ]; then
		echo $yellowintensy"[+] Useful home users:"$white
		echo -e $redintensy"$HOMEUSERS\n"$white
	fi

	PASSWD=$(cat /etc/passwd | grep "/bin/bash\|/bin/sh\|/bin/dash\|/bin/zsh" 2>/dev/null)
	if [ "$PASSWD" ]; then
		echo $yellowintensy"[+] From /etc/passwd - /bin/bash /bin/sh /bin/zsh /bin/dash:"$white
		echo -e "$PASSWD\n"
	fi

	CHECKETC=$(find /etc/ -maxdepth 1 -name "*.conf" -type f -exec ls -la {} \; 2>/dev/null)
	if [ "$CHECKETC" ]; then
		echo $yellowintensy"[+] All *.conf files in /etc (recursive 1 level):"$white
		echo -e "$CHECKETC\n"
	fi

	MASTERPASS=$(cat /etc/master.passwd 2>/dev/null)
	if [ "$MASTERPASS" ]; then
		echo $yellowintensy"[+] Check to see if we can read master.passwd:"$white
		echo $redintensy"[!] Readable - /etc/master.passwd"$white
		echo -e "$MASTERPASS\n"
	fi

	SUDOPASS=$(echo '' | sudo -S -l 2>/dev/null)
	if [ "$SUDOPASS" ]; then
		echo $yellowintensy"[+] Sudo permissions"$white
		echo $redintensy"[!] We can run sudo without supplying a password:"$white
		echo -e "$SUDOPASS\n"
	fi

	
	echo $yellowintensy"[+] From /etc - /etc/passwd /etc/shadow /etc/group /etc/sudoers:"$white
	WRPASS=$(ls -l /etc/passwd 2>/dev/null)
	if [ -w /etc/passwd ]; then
		echo $redintensy"$WRPASS"$white
	else
		echo "$WRPASS"
	fi

	WXSHADOW=$(ls -l /etc/shadow 2>/dev/null)
	if [ -w /etc/shadow ] || [ -r /etc/shadow ]; then
		echo $redintensy"$WXSHADOW"$white
	else
		echo "$WXSHADOW"
	fi

	WRGROUP=$(ls -l /etc/group 2>/dev/null)
	if [ -w /etc/group ]; then
		echo $redintensy"$WRGROUP"$white
	else
		echo "$WRGROUP"
	fi

	WRSUDOERS=$(ls -l /etc/sudoers 2>/dev/null)
	if [ -w /etc/sudoers ] || [ -r /etc/sudoers ]; then
		echo $redintensy"$WRSUDOERS"$white
	else
		echo "$WRSUDOERS"
	fi
	echo ""

	if [ -r /var/backups/passwd.bak ] || [ -r /var/backups/group.bak ] || [ -r /var/backups/shadow.bak ] || [ -r /var/backups/gshadow.bak ]; then
		echo $yellowintensy"[+] Check backup files:"$white
		BACKUPPASS=$(ls -l /var/backups/passwd.bak 2>/dev/null)
		if [ -r /var/backups/passwd.bak ]; then
			echo $redintensy"$BACKUPPASS"$white
		else
			echo "$BACKUPPASS"
		fi

		BACKUPGROUP=$(ls -l /var/backups/group.bak 2>/dev/null)
		if [ -r /var/backups/group.bak  ]; then
			echo $redintensy"$BACKUPGROUP"$white
		else
			echo "$BACKUPGROUP"
		fi

		BACKUPSHADOW=$(ls -l /var/backups/shadow.bak 2>/dev/null)
		if [ -r /var/backups/shadow.bak ]; then
			echo $redintensy"$BACKUPSHADOW"$white
		else
			echo "$BACKUPSHADOW"
		fi

		BACKUPGSHADOW=$(ls -l /var/backups/gshadow.bak 2>/dev/null)
		if [ -r /var/backups/gshadow.bak ]; then
			echo $redintensy"$BACKUPGSHADOW"$white
		else
			echo "$BACKUPGSHADOW"
		fi
	fi

	UNUSUALF=$(ls -la / | grep -v 'total ' 2>/dev/null)
	if [ "$UNUSUALF" ]; then
		echo $yellowintensy"[+] From / - any interesting folder/files:"$white
		echo -e "$UNUSUALF\n"$white
	fi

	if [ -d /var/mail ]; then
		MAILVAR=$(for x in "/var/mail"; do ls -lh "$x"; done | grep -v "total " 2>/dev/null)
		if [ "$MAILVAR" ]; then
			echo $yellowintensy"[+] Interesting mail in /var/mail:"$white
			echo -e "$MAILVAR\n"
		fi
	fi

	if [ -e /var/mail/root ]; then
		echo $yellowintensy"[+] Is /var/mail/root exist - you can try to read it:"$white
		$ROOTMAIL=$(ls -l /var/mail/root | grep -v "total " 2>/dev/null)
		echo -e $redintensy"$ROOTMAIL"$white
	fi
	
	ROOTDIR=$(for x in "/root"; do ls -lh "$x"; done 2>/dev/null)
	if [ "$ROOTDIR" ]; then
		echo $yellowintensy"[+] Check if /root is accessible:"$white
		echo $redintensy"[!] Root directory can be accessible"$white
		echo -e "$ROOTDIR\n"
	fi

	HOMEDIR=$(for x in "/home"; do ls -lh "$x"; done 2>/dev/null)
	if [ "$HOMEDIR" ]; then
		echo $yellowintensy"[+] Interesting /home/* directory:"$white
		echo -e $redintensy"$HOMEDIR\n"$white
	fi

	HOMEHISTORY=$(find /home/* -name *.*history* -print 2> /dev/null)
	if [ "$HOMEHISTORY" ]; then
		echo $yellowintensy"[+] History files of /home/*/:"$white
		echo -e $redintensy"$HOMEHISTORY\n"$white
	fi

	ROOTHISTORY=$(for x in /root/.*_history; do ls -lh "$x"; done 2>/dev/null)
	if [ "$ROOTHISTORY" ]; then
		echo $yellowintensy"[+] History files of /root:"$white
		echo -e $redintensy"$ROOTHISTORY\n"$white
	fi

	GREPPASSWDHISTORY=$(grep passwd /home/*/.bash_history 2>/dev/null)
	if [ "$GREPPASSWDHISTORY" ]; then
		echo $yellowintensy"[+] Grep passwd from .bash_history:"$white
		echo -e $redintensy"$GREPPASSWDHISTORY\n"$white
	fi

	if [ -e ~/.bash_history ]; then
		echo $yellowintensy"[+] ~/.bash_history - snippet below:"$white
		BASHHISTORY=$(head ~/.bash_history)
		echo -e $redintensy"$BASHHISTORY\n"$white
	fi

	if [ -e ~/.nano_history ]; then
		echo $yellowintensy"[+] ~/.nano_history - snippet below:"$white
		NANOHISTORT=$(head ~/.nano_history)
		echo -e $redintensy"$NANOHISTORT\n"$white
	fi

	if [ -e ~/.mysql_history ]; then
		echo $yellowintensy"[+] ~/.mysql_history - snippet below:"$white
		MYSQLHISTORY=$(head ~/.mysql_history)
		echo -e $redintensy"$MYSQLHISTORY\n"$white
	fi

	if [ -e ~/.php_history ]; then
		echo $yellowintensy"[+] ~/.php_history - snippet below:"$white
		PHPHISTORY=$(head ~/.php_history)
		echo -e $redintensy"$PHPHISTORY\n"$white
	fi

	for usersshfolder in /home/*/.ssh
	do
		echo $yellowintensy"[+] Any private-key info - /home/*/.ssh/:"$white
		ls -ld "$usersshfolder"
		for files in $usersshfolder
		do
        	if [ -r "$files" ]; then
        		sshfile=$(ls -l "$files" | grep -v "total " 2>/dev/null)
        		echo -e $redintensy"$sshfile READABLE\n"$white
        	fi
        done
    done
        
	if [ -d /root/.ssh ]; then
	    echo $yellowintensy"[+] Any private-key info - /root/.ssh/:"$white
	    ls -ld /root/.ssh/
	    for rootsshfiles in "/root/.ssh"
	    do
		    if [ -r "$rootsshfiles" ]; then
			    rootsshfile=$(ls -l "$files" | grep -v "total " 2>/dev/null)
			    echo -e $redintensy"$rootsshfile [READABLE]\n"$white
	        else
				LISTSSHROOT=$(ls -ld /root/.ssh/)
				echo -e "$LISTSSHROOT\n"
	   	     fi
	    done
	fi

	ROOTLOGIN=$(grep "PermitRootLogin" /etc/ssh/sshd_config | grep -v "#" | awk '{print $2}')
	if [ "$ROOTLOGIN" ]; then
		echo $yellowintensy"[+] Check if PermitRootLogin is on:"$white
		echo $redintensy"[!] Root is allowed to login via SSH"$white
		echo -e "$ROOTLOGIN\n"
	fi
	
	PGPKEY=$(ls -l /home/*/.gnupg/secring.gpgs 2>/dev/null)
	if [ "$PGPKEY" ]; then
        echo $yellowintensy"[+] PGP keys:"$white
        echo -e $redintensy"$PGPKEY\n"$white
    fi

	Kerberos1=$(ls -l /tmp/krb5.keytab 2>/dev/null)
	if [ "$Kerberos1" ]; then
		echo $yellowintensy"[+] Kerberos tickets - krb5.keytab:"$white
		echo -e $redintensy"$Kerberos1\n"$white
	fi

	Kerberos2=$(ls -l /tmp/krb5cc_* 2>/dev/null)
	if [ "$Kerberos2" ]; then
		echo $yellowintensy"[+] Kerberos tickets - krb5cc_*:"$white
    	echo -e $redintensy"$Kerberos2\n"$white
	fi

	LOGINDEFS=$(grep "^PASS_MAX_DAYS\|^PASS_MIN_DAYS\|^PASS_WARN_AGE\|^ENCRYPT_METHOD" /etc/login.defs 2>/dev/null)
	if [ "$LOGINDEFS" ]; then
		echo $yellowintensy"[+] Password Policy:"$white
		echo -e "$LOGINDEFS\n"
	fi

	UMASKVALUE=$(umask 2>/dev/null & umask -S 2>/dev/null)
	if [ "$UMASKVALUE" ]; then
 		echo $yellowintensy"[+] Current umask value:"$white
 		echo -e "$UMASKVALUE\n"
  	fi
	
	RHOSTUSR=$(find /home -iname "*.rhosts" -exec ls -la {} \; 2>/dev/null)
	if [ "$RHOSTUSR" ]; then
		echo $yellowintensy"[+] Accessible rhosts config file(s):"$white
		echo -e $redintensy"$RHOSTUSR\n"$white
	fi

	WIRELESSKEY=$(grep -E "^id|^psk" /etc/NetworkManager/system-connections/* 2>/dev/null)
	if [ "$WIRELESSKEY" ]; then
		echo $yellowintensy"[+] Cleartext Pre-Shared Wireless Keys from Network Manager:"$white
		echo -e $redintensy"$WIRELESSKEY\n"$white
	fi
}

function FileSystem(){
	echo $boldgrn"[-] FILE SYSTEM"$white
	VAR=$(for x in "/var"; do ls -lh "$x"; done | grep -v "total" 2>/dev/null)
	if [ "$VAR" ]; then
		echo $yellowintensy"[+] Any interesting file/folder in /var:"$white
		echo -e "$VAR\n"
	fi

	WWW=$(for x in "/var/www"; do ls -lh "$x"; done 2>/dev/null)
	if [ -d /var/www ]; then
		echo $yellowintensy"[+] Any interesting file/folder in /var/www:"$white
		echo -e "$WWW\n"
	fi

	HTML=$(for x in "/var/www/html"; do ls -lh "$x"; done 2>/dev/null)
	if [ -d /var/www/html ]; then
		echo $yellowintensy"[+] Any interesting file/folder in /var/www/html:"$white
		echo -e "$HTML\n"
	fi

	VARTMP=$(for x in "/var/tmp"; do ls -lh "$x"; done 2>/dev/null)
	if [ -d /var/tmp ]; then
		echo $yellowintensy"[+] Any interesting file/folder in /var/tmp - no cleanup after reboot:"$white
		echo -e "$VARTMP\n"
	fi

	CONFIGDB=$(find /var/ -iname "config.*" -type f -exec ls -l {} \; 2>/dev/null && find /var/ -iname "db.*" -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$CONFIGDB" ]; then
		echo $yellowintensy"[+] Search on config.* and db.* files on /var:"$white
		echo -e "$CONFIGDB\n"
	fi

	CONFIGPASS=$(grep -r 'password' /etc/*.conf 2>/dev/null)
	if [ "$CONFIGPASS" ]; then
		echo $yellowintensy"[+] Find conf files that contain the string 'password':"$white
		echo -e "$CONFIGPASS\n"
	fi

 	HIDDENFILES=$(find / -name ".*" -type f ! -path "/proc/*" ! -path "/sys/*" -exec ls -al {} \; 2>/dev/null)
 	if [ "$HIDDENFILES" ]; then
 		echo $yellowintensy"[+] Hidden files:"$white
 		echo -e "$HIDDENFILES\n"
 	fi

	PASSWORDFILES=$(find /home -name "pass*" -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$PASSWORDFILES" ]; then
		echo $yellowintensy"[+] Clear text password on /home/*:"$white
		echo -e $redintensy"$PASSWORDFILES\n"$white
	fi

	SYSTEMSSHCHECK=$(find / \( -name "id_dsa*" -o -name "id_rsa*" -o -name "known_hosts" -o -name "authorized_hosts" -o -name "authorized_keys" \) -exec ls -la {} \; 2>/dev/null)
	if [ "$SYSTEMSSHCHECK" ]; then
		echo $yellowintensy"[+] SSH files:"$white
		echo -e $redintensy"$SYSTEMSSHCHECK\n"$white
	fi

	SUID=$(find / -perm -u=s -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$SUID" ]; then
		echo $yellowintensy"[+] SUID - 4000:"$white
		echo -e "$SUID\n"
	fi

	SGID=$(find / -perm -g=s -type f -exec ls -l {} \; 2>/dev/null)
	if [ "$SGID" ]; then
		echo $yellowintensy"[+] SGID - 2000:"$white
		echo -e "$SGID\n"
	fi

	STICKY=$(find / -perm -1000 -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$STICKY" ]; then
		echo $yellowintensy"[+] Sticky bit for folders - 1000:"$white
		echo -e "$STICKY\n"
	fi

	CATCHECK=$(command -v cat 2>/dev/null)
	TAILCHECK=$(command -v tail 2>/dev/null)
	HEADCHECK=$(command -v head 2>/dev/null)
	MORECHECK=$(command -v more 2>/dev/null)
	LESSCHECK=$(command -v less 2>/dev/null)
	NANOCHECK=$(command -v nano 2>/dev/null)
	VIMBASICCHECK=$(command -v vim.basic 2>/dev/null)

	if [ -u "$CATCHECK" ] || [ -u "$TAILCHECK" ] || [ -u "$HEADCHECK" ] || [ -u "$MORECHECK" ] || [ -u "$LESSCHECK" ] || [ -u "$NANOCHECK" ] || [ -u "$VIMBASICCHECK" ]; then
		echo $yellowintensy"[+] Using SUIDs to read/write root files:"$white
		if [ -u "$CATCHECK" ]; then
			ACATCHECK=$(ls -l "$CATCHECK" 2>/dev/null)
			echo $redintensy"$ACATCHECK"$white
		fi

		if [ -u "$TAILCHECK" ]; then
			ATAILCHECK=$(ls -l "$TAILCHECK" 2>/dev/null)
			echo $redintensy"$ATAILCHECK"$white
		fi

		if [ -u "$HEADCHECK" ]; then
			AHEADCHECK=$(ls -l "$HEADCHECK" 2>/dev/null)
			echo $redintensy"$AHEADCHECK"$white
		fi

		if [ -u "$MORECHECK" ]; then
			AMORECHECK=$(ls -l "$MORECHECK" 2>/dev/null)
			echo $redintensy"$AMORECHECK"$white
		fi

		if [ -u "$LESSCHECK" ]; then
			ALESSCHECK=$(ls -l "$LESSCHECK" 2>/dev/null)
			echo $redintensy"$ALESSCHECK"$white
		fi

		if [ -u "$NANOCHECK" ]; then
			ANANOCHECK=$(ls -l "$NANOCHECK" 2>/dev/null)
			echo $redintensy"$ANANOCHECK"$white
		fi

		if [ -u "$VIMBASICCHECK" ]; then
			AVIMBASICCHECK=$(ls -l "$VIMBASICCHECK" 2>/dev/null)
			echo $redintensy"$AVIMBASICCHECK"$white
		fi
	fi
	echo ""

	LPYTHONCHECK=$(command -v python 2>/dev/null)
	LPYTHON2CHECK=$(command -v python2 2>/dev/null)
	LPYTHON3CHECK=$(command -v python3 2>/dev/null)
	LPERLCHECK=$(command -v perl 2>/dev/null)
	LRUBYCHECK=$(command -v ruby 2>/dev/null)
	LPHPCHECK=$(command -v php 2>/dev/null)
	LAWKCHECK=$(command -v awk 2>/dev/null)

	if [ -u "$LPYTHONCHECK" ] || [ -u "$LPYTHON2CHECK" ] || [ -u "$LPYTHON3CHECK" ] || [ -u "$LPERLCHECK" ] || [ -u "$LRUBYCHECK" ] || [ -u "$LPHPCHECK" ] || [ -u "$LAWKCHECK" ]; then
		echo $yellowintensy"[+] SUID for Proramming Language:"$white
		if [ -u "$LPYTHONCHECK" ]; then
			ALPYTHONCHECK=$(ls -l "$LPYTHONCHECK" 2>/dev/null)
			echo $redintensy"$ALPYTHONCHECK"$white
		fi

		if [ -u "$LPYTHON2CHECK" ]; then
			ALPYTHON2CHECK=$(ls -l "$LPYTHON2CHECK" 2>/dev/null)
			echo $redintensy"$ALPYTHON2CHECK"$white
		fi

		if [ -u "$LPYTHON3CHECK" ]; then
			ALPYTHON3CHECK=$(ls -l "$LPYTHON3CHECK" 2>/dev/null)
			echo $redintensy"$ALPYTHON3CHECK"$white
		fi

		if [ -u "$LPERLCHECK" ]; then
			ALPERLCHECK=$(ls -l "$LPERLCHECK" 2>/dev/null)
			echo $redintensy"$ALPERLCHECK"$white
		fi

		if [ -u "$LRUBYCHECK" ]; then
			ALRUBYCHECK=$(ls -l "$LRUBYCHECK" 2>/dev/null)
			echo $redintensy"$ALRUBYCHECK"$white
		fi

		if [ -u "$LPHPCHECK" ]; then
			ALPHPCHECK=$(ls -l "$LPHPCHECK" 2>/dev/null)
			echo $redintensy"$ALPHPCHECK"$white
		fi

		if [ -u "$LAWKCHECK" ]; then
			ALAWKCHECK=$(ls -l "$LAWKCHECK" 2>/dev/null)
			echo $redintensy"$ALAWKCHECK"$white
		fi
	fi
	echo ""

	WRITABLE=$(find / -perm -222 -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$WRITABLE" ]; then
		echo $yellowintensy"[+] World-writable folders - 222:"$white
		echo -e "$WRITABLE\n"
	fi

	EXECUTABLE=$(find / -perm -o x -type d -exec ls -ld {} \; 2>/dev/null)
	if [ "$EXECUTABLE" ]; then
		echo $yellowintensy"[+] World-executable folders:"$white
		echo -e "$EXECUTABLE\n"
	fi

	
	FILEWRITABLE=$(find / -path /proc -prune -o -perm -0002 ! -type l -ls 2>/dev/null)
	if [ "$FILEWRITABLE" ]; then
		echo $yellowintensy"[+] World-writable files - 0002:"$white
		echo -e "$FILEWRITABLE\n"
	fi

	LOGFILES=$(find /var/log -type f -perm -0004 -user root -exec ls -l {} \; 2>/dev/null)
	if [ "$LOGFILES" ]; then
		echo $yellowintensy"[+] World-readable logfiles- owned by root - 0004:"$white
		echo -e "$LOGFILES\n"$white
	fi

	NSFEXPORTS=$(ls -la /etc/exports 2>/dev/null)
	if [ "$NSFEXPORTS" ]; then
		echo $yellowintensy"[+] List NFS shares and permisisons:"$white
  		echo "$NSFEXPORTS"$white
  	fi
}

function DevToolsAndLang(){
	echo $boldgrn"[-] DEVELOPMENT TOOLS and LANGUAGES"$white
	echo $yellowintensy"[+] Development supported tools:"$white
	PYTHON=$(command -v python 2>/dev/null)
	if [ "$PYTHON" ]; then
		echo "$PYTHON"
	fi

	PYTHON3=$(command -v python3 2>/dev/null)
	if [ "$PYTHON3" ]; then
		echo "$PYTHON3"
	fi

	PYTHON2=$(command -v python2 2>/dev/null)
	if [ "$PYTHON2" ]; then
		echo "$PYTHON2"
	fi

	PERL=$(command -v perl 2>/dev/null)
	if [ "$PERL" ]; then
		echo "$PERL"
	fi

	PHP=$(command -v php 2>/dev/null)
	if [ "$PHP" ]; then
		echo "$PHP"
	fi

	GCC=$(command -v gcc 2>/dev/null)
	if [ "$GCC" ]; then
		echo "$GCC"
	fi

	CC=$(command -v cc 2>/dev/null)
	if [ "$CC" ]; then
		echo "$CC"
	fi

	AWK=$(command -v awk 2>/dev/null)
	if [ "$AWK" ]; then
		echo "$AWK"
	fi

	RUBY=$(command -v ruby 2>/dev/null)
	if [ "$RUBY" ]; then
		echo "$RUBY"
	fi

	DGBCH=$(command -v gdb 2>/dev/null)
	if [ "$DGBCH" ]; then
		echo "$DGBCH"
	fi

	EXPECTCH=$(command -v expect 2>/dev/null)
	if [ "$EXPECTCH" ]; then
		echo "$EXPECTCH"
	fi

	NMAP=$(command -v nmap 2>/dev/null)
	if [ "$NMAP" ]; then
		echo "$NMAP"
	fi

	echo ""
	echo $yellowintensy"[+] Download/Upload tools:"$white
	FTP=$(command -v ftp 2>/dev/null)
	if [ "$FTP" ]; then
		echo "$FTP"
	fi

	TFTP=$(command -v tftp 2>/dev/null)
	if [ "$TFTP" ]; then
		echo "$TFTP"
	fi

	NETCAT=$(command -v netcat 2>/dev/null)
	if [ "$NETCAT" ]; then
		echo "$NETCAT"
	fi

	NC=$(command -v nc 2>/dev/null)
	if [ "$NC" ]; then
		echo "$NC"
	fi

	socat=$(command -v socat 2>/dev/null)
	if [ "$SOCAT" ];
	then
		echo "$SOCAT"
	else
		:
	fi

	WGET=$(command -v wget 2>/dev/null)
	if [ "$WGET" ]; then
		echo "$WGET"
	fi

	CURL=$(command -v curl 2>/dev/null)
	if [ "$CURL" ]; then
		echo "$CURL"
	fi

	W3M=$(command -v w3m 2>/dev/null)
	if [ "$W3M" ]; then
		echo "$W3M"
	fi

	ELINKS=$(command -v elinks 2>/dev/null)
	if [ "$ELINKS" ]; then
		echo "$ELINKS"
	fi

	AXEL=$(command -v axel 2>/dev/null)
	if [ "$AXEL" ]; then
		echo "$AXEL"
	fi

	FETCHBSD=$(command -v fetch 2>/dev/null)
	if [ "$FETCHBSD" ]; then
		echo "$FETCHBSD"
	fi

	echo ""
	echo $yellowintensy"[+] Escape the shell:"$white
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
	echo "node   =	node -e 'var exec = require(\"child_process\").exec; exec(\"id\", function (error, stdOut, stdErr) {console.log(stdOut);});'"
	echo ""
	echo $redintensy" ** You can replace the 'sh' with 'bash'** "$white
	echo ""

	PRINTENV=$(printenv 2>/dev/null)
	if [ "$PRINTENV" ]; then
		echo $yellowintensy"[+] Display the environment variables:"$white
		echo -e "$PRINTENV\n"
	fi

	SHELLS=$(cat /etc/shells 2>/dev/null)
	if [ "$SHELLS" ]; then
		echo $yellowintensy"[+] Display available shells:"$white
		echo -e "$SHELLS\n"
	fi
}

function SoftwareVersion(){
	echo $boldgrn"[-] SOFTWARE VERSION"$white
	SUDOVER=$(sudo -V | grep -i "version" | grep "Sudo " 2>/dev/null)
	if [ "$SUDOVER" ]; then
		echo $yellowintensy"[+] Sudo version:"$white
		echo -e "$SUDOVER\n"
		SUDOVERSION=1.9.12p2
		SUDOVERCVE=$(sudo -V | grep -i "version" | grep "Sudo " | cut -d " " -f "3" 2>/dev/null)
		SUDOMAXVUL=$(echo "$SUDOVERCVE $SUDOVERSION" | awk '{if ($1 < $2) print "3"; else print "4"}')
		if [ $SUDOMAXVUL == 3 ]; then
			echo $redintensy"[!] SUDO is vulnerable to CVE-2023-22809\n"$white
		fi
	fi

	MYSQLVER=$(mysql -V 2>/dev/null)
	if [ "$MYSQLVER" ]; then
		echo $yellowintensy"[+] MYSQL version:"$white
		echo -e "$MYSQLVER\n"
	fi

	PSQL=$(psql -V 2>/dev/null)
	if [ "$PSQL" ]; then
		echo $yellowintensy"[+] PostgreSQL version:"$white
		echo -e "$PSQL\n"
	fi

	APACHEVER=$(apache2 -v 2>/dev/null)
	if [ "$APACHEVER" ]; then
		echo $yellowintensy"[+] Apache version:"$white
		echo -e "$APACHEVER\n"
	fi

	APACHEUSER=$(grep -i 'user\|group' /etc/apache2/envvars 2>/dev/null | awk '{sub(/.*\export /,"")}1' 2>/dev/null)
	if [ "$APACHEUSER" ]; then
		echo $yellowintensy"[+] Account running under apache service:"$white
		echo -e "$APACHEUSER\n"
	fi

	ACCESSLOG=$(grep -E '^user|^pass' /var/log/apache/access.log 2>/dev/null)
	if [ "$ACCESSLOG" ]; then
		echo $yellowintensy"[+] Grep the apache access.log file for “user” and “pass” strings:"$white
		echo -e $redintensy"$ACCESSLOG\n"$white
	fi

	CHKROOTKIT=$(chkrootkit -V 2>/dev/null)
	if [ "$CHKROOTKIT" ]; then
		echo $yellowintensy"[+] Chkrootkit version (if version < 0.50):"$white
		echo -e "$CHKROOTKIT\n"
		echo -e $redintensy"https://www.exploit-db.com/exploits/33899"$white
	fi

	PKEXEC=$(pkexec --version 2>/dev/null)
	if [ "$PKEXEC" ]; then
		echo $yellowintensy"[+] Pkexec version:"$white
		echo -e "$PKEXEC"
		echo -e $redintensy"https://github.blog/security/vulnerability-research/privilege-escalation-polkit-root-on-linux-with-bug\n"$white
	fi

	JAVA=$(java -version 2>/dev/null)
	if [ "$JAVA" ]; then
		echo $yellowintensy"[+] Java version:"$white
		echo -e "$JAVA\n"
	fi

	EXIM=$(exim -bV 2>/dev/null)
	if [ "$EXIM" ]; then
		echo $yellowintensy"[+] Exim version (<= 4.91):"$white
		echo -e "$EXIM\n"
	fi

	UDEV=$(udevadm --version 2>/dev/null)
	if [ "$UDEV" ]; then
		echo $yellowintensy"[+] Udev version (< 232):"$white
		echo -e "Udev version: $UDEV\n"
	fi
}

function TryingAccess(){
	echo $boldgrn"[-] TRYING ACCESS"$white
	MYSQLCONNECT=$(mysqladmin -uroot -proot version 2>/dev/null)
	if [ "$MYSQLCONNECT" ]; then
		echo $yellowintensy"[+] Connect to MYSQL with root/root creds:"$white
		echo $redintensy"[!] We can connect to the local MYSQL service with default root/root credentials."$white
		echo -e "$MYSQLCONNECT\n"
	fi

	MYSQLCONNECTNOPASS=$(mysqladmin -uroot version 2>/dev/null)
	if [ "$MYSQLCONNECTNOPASS" ]; then
		echo $yellowintensy"[+] Connect to MYSQL as root and non-pass:"$white
	  	echo $redintensy"[!] We can connect to the local MYSQL service as 'root' and without a password."$white
	  	echo -e "$MYSQLCONNECTNOPASS\n" 
	fi

	POSTCON1=$(psql -U postgres template0 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON1" ]; then
		echo $yellowintensy"[+] Connect to Postgres DB 'template0' as user 'postgres' and non-pass:"$white
		echo $redintensy"[!] We can connect to Postgres DB 'template0' as user 'postgres' with no password."$white
		echo -e "$POSTCON1\n"
	fi

	POSTCON11=$(psql -U postgres template1 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON11" ]; then
		echo $yellowintensy"[+] Connect to Postgres DB 'template1' as user 'postgres' and non-pass:"$white
		echo $redintensy"[!] We can connect to Postgres DB 'template1' as user 'postgres' with no password."$white
		echo -e "$POSTCON11\n"
	fi

	POSTCON2=$(psql -U pgsql template0 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON2" ]; then
		echo $yellowintensy"[+] Connect to Postgres DB 'template0' as user 'psql' and non-pass:"$white
		echo $redintensy"[!] We can connect to Postgres DB 'template0' as user 'psql' with no password."$white
		echo -e "$POSTCON2\n"
	fi

	POSTCON22=$(psql -U pgsql template1 -c 'select version()' 2>/dev/null | grep version)
	if [ "$POSTCON22" ]; then
		echo $yellowintensy"[+] Connect to Postgres DB 'template1' as user 'psql' and non-pass:"$white
		echo $redintensy"[!] We can connect to Postgres DB 'template1' as user 'psql' with no password."$white
		post -e "$POSTCON22\n"
	fi

	FSTAB=$(grep username /etc/fstab 2>/dev/null |awk '{sub(/.*\username=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo username: 2>/dev/null; grep password /etc/fstab 2>/dev/null |awk '{sub(/.*\password=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo password: 2>/dev/null; grep domain /etc/fstab 2>/dev/null |awk '{sub(/.*\domain=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo domain: 2>/dev/null)
	if [ "$FSTAB" ]; then
		echo $yellowintensy"[+] Any creds in /etc/fstab:"$white
		echo $redintensy"[!] Looks like there are credentials in /etc/fstab."$white
		echo -e "$FSTAB\n"
	fi

	FSTABCRED=$(grep cred /etc/fstab 2>/dev/null |awk '{sub(/.*\credentials=/,"");sub(/\,.*/,"")}1' 2>/dev/null | xargs -I{} sh -c 'ls -la {}; cat {}' 2>/dev/null)
	if [ "$FSTABCRED" ]; then
		echo $yellowintensy"[+] Any creds file in /etc/fstab:"$white
		echo $redintensy"[!] /etc/fstab contains a credentials file."$white
		echo -e "$FSTABCRED\n"
	fi
}

# =========================
# Module Descriptions
# =========================
MODULE_DESCRIPTIONS=(
  [sys_config]="Identifies files with SUID, SGID, and sensitive configuration or database files."
  [sys_info]="Displays OS information, installed drivers, and defense mechanisms."
  [sys_escape]="Checks for shell escapes, environment variables, and privilege group memberships."
  [sys_network]="Lists DNS, ARP tables, host configurations, and active TCP/UDP connections."
  [sys_cron]="Enumerates active services, cron jobs, and scheduled tasks."
  [sys_soft]="Retrieves software versions for vulnerability checks."
  [sys_db]="Examines /etc/fstab for stored credentials and accessible databases."
  [sys_exploit]="Searches for potential kernel privilege escalation exploits."
  [sys_user]="Finds backup files, SSH keys, Sudoes, and password policies."
)

modules=("${!MODULE_DESCRIPTIONS[@]}")

# =========================
# Helper Functions
# =========================

# List available modules
show_modules() {
  echo "Available modules:"
  for module in "${!MODULE_DESCRIPTIONS[@]}"; do
    echo "  - $module		${MODULE_DESCRIPTIONS[$module]}"
  done
}

# Load a module
use_module() {
  if [[ -z $1 ]]; then
    echo "No module specified. Use 'show' to list available modules."
    return
  fi

  if [[ -n "${MODULE_DESCRIPTIONS[$1]}" ]]; then
    CURRENT_MODULE=$1
    echo "Loaded module: $CURRENT_MODULE"
    echo "Description: ${MODULE_DESCRIPTIONS[$CURRENT_MODULE]}"
  else
    echo "Invalid module '$1'. Use 'show' to list available modules."
  fi
}

# Run the selected module
run_module() {
  if [[ -z "$CURRENT_MODULE" ]]; then
    echo "No module selected. Use 'use <module>' to select one."
  else
    echo "Running $CURRENT_MODULE"
    case $CURRENT_MODULE in
      sys_config) FileSystem ;;
	  sys_info) OperatingSystem ;;
	  sys_escape) DevToolsAndLang  ;;
	  sys_network) CommAndNet ;;
	  sys_cron) AppsAndServices  ;;
	  sys_soft) SoftwareVersion ;;
	  sys_db) TryingAccess ;;
	  sys_exploit) KernelExploits ;;
	  sys_user) ConfidentialInfoAndUser ;;
      *) echo "Unknown module: $CURRENT_MODULE" ;;
    esac
  fi
}


# Display the current version
version() {
  echo "Postenum version: $CURRENT_VERSION"
}

# Clear the console
clear_screen() {
  clear
}

# Reload the currently loaded module
reload_module() {
  if [[ -z "$CURRENT_MODULE" ]]; then
    echo "No module currently loaded. Use 'use <module>' to load one."
  else
    CURRENT_MODULE=""
    echo "Module has been reset. Use 'use <module>' to load a new module."
  fi
}

_complete_input() {
  local line="${READLINE_LINE}"
  local word="${line##* }"
  local candidates=()

  # Provide module names only when 'use' is typed
  if [[ "$line" == use* ]]; then
    candidates=("${modules[@]}")
  else
    candidates=("use" "run" "show" "version" "clear" "reload" "banner" "exit" "help")
  fi

  # Filter matching candidates
  local matches=($(compgen -W "${candidates[*]}" -- "$word"))

  # Print matches below the prompt if there are any
  if (( ${#matches[@]} > 1 )); then
    echo -e $redbold"\npostenum > "$white$line
    for match in "${matches[@]}"; do
      printf "%s\n" "$match"
    done
    echo  # Extra newline for better readability
  fi

  # If there's exactly one match, replace the word in the input line
  if (( ${#matches[@]} == 1 )); then
    READLINE_LINE="${line%$word}${matches[0]} "  # Replace the current word with the match
    READLINE_POINT=${#READLINE_LINE}              # Update the cursor position
  fi
}

bind -x '"\t": _complete_input'

add_to_history() {
  history+=("$1")
  history_index=${#history[@]}  # Reset index to end of history
}

scroll_history_up() {
  if (( history_index > 0 )); then
    ((history_index--))
    READLINE_LINE="${history[$history_index]}"
    READLINE_POINT=${#READLINE_LINE}
  fi
}

scroll_history_down() {
  if (( history_index < ${#history[@]} - 1 )); then
    ((history_index++))
    READLINE_LINE="${history[$history_index]}"
  else
    history_index=${#history[@]}  # Reset to allow new input
    READLINE_LINE="$current_input"
  fi
  READLINE_POINT=${#READLINE_LINE}
}

bind -x '"\e[A": scroll_history_up'   # Up arrow
bind -x '"\e[B": scroll_history_down' # Down arrow

banner

while true; do
  read -e -p $redbold"postenum > "$white cmd args

  if [[ -z "$cmd" ]]; then
    echo "Command cannot be empty. Type 'help' for usage."
    continue
  fi

  # Add non-empty commands to history
  if [[ -n "$cmd" ]]; then
    add_to_history "$cmd $args"
  fi

  case $cmd in
    use) use_module "$args";;
    run) run_module ;;
    show) show_modules ;;
    version) version ;;
    clear) clear_screen ;;
    reload) reload_module ;;
	banner) banner ;;
    exit) echo "Exiting Postenum..."; break ;;
    help)
      echo "Available commands:"
      echo "  use <module>   - Load a specific module"
      echo "  run            - Run the currently loaded module"
      echo "  show           - Show available modules"
      echo "  version        - Display the current version"
      echo "  clear          - Clear the console"
      echo "  reload         - Reset the loaded module"
      echo "  banner         - Display the banner"
      echo "  exit           - Exit Postenum"
      ;;
    *)
      echo "Unknown command: '$cmd'. Type 'help' for usage." ;;
  esac
done
