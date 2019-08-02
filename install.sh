#!/bin/bash

# License: MIT

# Postenum version 0.8

# Installation script for Postenum. For system/network admins.
# Create a Hard symbolic link.

# create variables
grnintensy=$'\e[0;92m'
white=$'\e[0m'
redintensy=$'\e[0;91m'

function Install(){
	sudo chmod +x postenum.sh
	RUN=$(pwd)
	if [ "$RUN" ];
	then
		if [ -e /usr/local/bin/postenum ];
		then
			echo $grnintensy"[+] Postenum already exist!"$white
		else
	        sudo ln "${RUN}/postenum.sh" /usr/local/bin/postenum
	        if [ -e /usr/local/bin/postenum ];
	        then
	        	echo $grnintensy"[+] Postenum installed successfully - /usr/local/bin/postenum"$white
	        else
	        	echo $redintensy"[-] Postenum still not installed, check again !"$white
	        fi
	    fi
	else
	        echo $redintensy"[-] Check again, something wrong !"$white
	fi
}

Install