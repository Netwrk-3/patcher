#!/bin/bash

# Patcher is written by Venkatesh Mishra (writes core features) and is currently maintaned by Netwrk-3 (update patcher-db).

command=$1
kernel=$2
version="0.1.34-stable"
RED='\033[0;31m'
NC='\033[0m'

help_menu () {
   echo "Patcher: The ultimate Linux system maintainence and security tool." && echo 'patcher -s or patcher --scan [scan a kernel version for vulnebilities]' && echo 'patcher -v or patcher --version [print the version of patcher]' && echo 'patcher -h or patcher --help [print the help menu]' && echo 'patcher -c or patcher --clean [cleanup your system and free up disk space]' && echo 'patcher kernel [display the kernel you are currently using]' && echo "patcher ip [display your system's public ip adress]" && echo "patcher --restart [reboots your machine securely using patcher's reboot scirpt]" && echo "patcher -hr or patcher --harden [harden the endpoint linux kernel]" && echo "patcher update [update patcher to the latest stable release]" && echo "patcher devs [patcher development team list]"
}
update_patcher() {
        if [ "$(id -u)" -ne 0 ]; then
                printf "${RED}[!] Error:${NC} Patcher needs to be updated with root privilages (use sudo or doas)\n"
        else
                echo "updating Patcher..." && git clone https://github.com/Emph-Inc/patcher.git && cd patcher && cd src && cp ./patcher.bash ./patcher && chmod +x ./patcher && cp ./patcher /usr/local/bin/ && cd .. && cd .. && rm -rf patcher/
                echo "Sucessfully Updated!"
        fi
}
secure_reboot() {
	if [ "$(id -u)" -ne 0 ];then
		printf "${RED}[!] Error:${NC} Try again with sudo or doas!\n"
	else
		killall $USER && echo 3 > /proc/sys/vm/drop_caches && Patcher -c && reboot # works best with systemd
        rm -rf /tmp/*
	fi
}

case "$command" in
    -s|--scan)
        # code to scan for vulnerabilities
        echo "Scanning kernel version $kernel for vulnerabilities..."
        ;;
    -v|--version)
        echo "Patcher version $version"
        ;;
    -h|--help)
        help_menu
        ;;
    -c|--clean)
        # code to clean up disk space
	if [ "$(id -u)" -ne 0 ]; then
            printf "${RED}[!] Error:${NC} Patcher's cleanup script requires evelavted privilages!\n"
        else
            echo 'starting Patcher cleanup script.' && echo 'deleting cache files...' && rm -rf /home/$USER/.cache/* && echo 'deleting temperary files...' && rm -rf /tmp/* && rm -rf
