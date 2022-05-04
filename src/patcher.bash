# Copyright (c) 2022 Venkatesh Mishra. All rights reserved
# Copyright (C) 2022 Netwrk-3, Inc. All rights reserved.
#!/bin/bash

opt=$1
kernel=$2
version="0.1.26-beta"
RED='\033[0;31m'
NC='\033[0m'

help_menu () {
   echo 'patcher -s or patcher --scan [scan a kernel version for vulnebilities]'
   echo 'patcher -v or patcher --version [print the version of patcher]'
   echo 'patcher -h or patcher --help [print the help menu]'
   echo 'patcher -c or patcher --clean [cleanup your system and free up disk space]'
   echo 'patcher kernel [display the kernel you are currently using]'
   echo "patcher ip [display your system's public ip adress]"
   echo "patcher --restart [reboots your machine securely using patcher's reboot scirpt]"
   echo "patcher -hr or patcher --harden [harden the endpoint linux kernel]"
   echo "patcher update [update patcher to the latest stable release]"
   echo "patcher devs [patcher development team list]"
}

update_patcher() {
        if [ "$(id -u)" -ne 0 ]; then
                printf "${RED}[!] Error:${NC} Patcher needs to be updated with root privilages\n"
        else
                echo "updating patcher..."
                git clone https://github.com/Emph-Inc/patcher.git && cd patcher && cd src && cp ./patcher.bash ./patcher && chmod +x ./patcher && cp ./patcher /usr/local/bin/ && cd .. && cd .. && rm -rf patcher/
        fi
}

secure_reboot() {
	killall $USER
	echo 3 > /proc/sys/vm/drop_caches
	reboot
}

# patcher's Linux kernel vulnebility scanner
if [ "$opt" = "-s" ] || [ "$opt" = "--scan" ];then
        if [ $kernel = "4.8.3" ];then 
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2016-5195"
        elif [ $kernel = "5.14.01" ] || [ $kernel = "5.8" ] || [ $kernel = "5.9" ] || [ $kernel = "5.10" ] || [ $kernel = "5.12" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2022-0847"
        elif [ $kernel = "5.13" ] || [ $kernel = "5.13.1" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2022-0742"
                echo "CVE-2022-0847"
    # Kernels in which CVE-2022-0847 is patched
        elif [ $kernel = "5.15.25" ] || [ $kernel = "5.10.102" ] || [ $kernel = "5.16.11" ];then
                echo "patcher-db did not find any vulnebilities for Linux kernel version $kernel"
        elif [ $kernel = "4.11" ] || [ $kernel = "4.9.6" ]; then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2017-18017"
        elif [ $kernel = "2.6" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2015-8812"
        elif [ $kernel = "3.2" ] || [ $kernel = "3.13" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2016-10229" 
        elif [ $kernel = "3.13.6" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2014-2523"
        elif [ $kernel = "4.8.13" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2016-10150"
        elif [ $kernel = "2.6.34" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2010-252"
        elif [ $kernel = "4.3" ] || [ $kernel = "4.2" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2017-13715"
        elif [ $kernel = "4.5.2" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2016-7117"
        else    
                echo "patcher-db did not find any vulnebilities for Linux kernel version $kernel"
        fi

elif [ "$opt" = "-v" ] || [ "$opt" = "--version" ];then
        echo "Patcher version $version"

elif [ "$opt" = "-h" ] || [ "$opt" = "--help" ];then
        help_menu
# Print the endpoint kernel
elif [ "$opt" = "kernel" ];then
        host_kernel=$(uname -rs) # Get the name & version of the kernel
        host_arch=$(uname -m) # Get the CPU's rchitecure
        echo "Endpoint kernel: $host_kernel"
        echo "Endpoint architecture: $host_arch"

elif [ "$opt" = "devs" ];then
    echo 'Patcher development team:'
    echo '1. Venkatesh Mishra (head developer)'
    echo "See patcher's source code at: https://github.com/Netwrk-3/patcher"
    echo "patcher's official website: https://netwrk-3.github.io/patcher/"
elif [ "$opt" = "-c" ] || [ "$opt" = "--clean" ];then
        if [ "$(id -u)" -ne 0 ]; then
                printf "${RED}[!] Error:${NC} patcher's cleanup script requires evelavted privilages!\n"
        else
            echo 'starting patcher cleanup script.'
            echo 'deleting cache files...'
            rm -rf /home/$USER/.cache/*
            echo 'deleting temperary files...'
            rm -rf /tmp/*
            echo 'dropping cached memory...'
            echo 3 > /proc/sys/vm/drop_caches
            # on debian / ubuntu based systems
            # echo 'removing orphan packages
            # apt clean && apt autoremove
            # on rhel / fedora based systems
            # echo 'removing orphan packages
            # dnf clean && dnf autoremove
            # on arch linux / manjaro based systems:
            # echo 'cleaning package cache and removing synced repositories:'
            # pacman -Scc && rm /var/lib/pacman/sync/*db
        fi
elif [ "$opt" = "update" ];then
     update_patcher
elif [ "$opt" = "ip" ];then
	ip=$(curl -s 'api.ipify.org')
	echo "Public IP adress: $ip"
elif [ "$opt" = "--restart" ];then
	secure_reboot
elif [ "$opt" = "-hr" ] || [ "$opt" = "--harden" ];then
   echo "Hardening your linux kernel..."
   systctl kernel.pid_max = 65536; sysctl kernel.core_uses_pid = 1;sysctl kernel.ctrl-alt-del = 0;sysctl kernel.shmmax = 268435456;sysctl kernel.shmall = 268435456;sysctl kernel.printk=3 3 3 3;sysctl kernel.sysrq=4; sysctl kernel.kptr_restrict=2; sysctl kernel.unprivileged_bpf_disabled=1;sysctl kernel.kexec_load_disabled=1;sysctl kernel.unprivileged_userns_clone=0; sysctl kernel.perf_event_paranoid=3;sysctl  kernel.yama.ptrace_scope=2;sysctl kernel.core_uses_pid = 1 && sysctl -p
else
   printf "${RED}[!] Error:${NC} please enter a valid argument (use patcher -h to see valid arguments)\n"
fi
