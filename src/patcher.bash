# Copyright (c) 2022 Venkatesh Mishra. All rights reserved
#!/bin/bash

opt=$1
kernel=$2
version="0.1.13-beta"

help_menu () {
   echo 'patcher -s [scan a kernel version for vulnebilities]'
   echo 'patcher -v [print the version of patcher]'
   echo 'patcher -h [print the help menu]'
   echo 'patcher -c [cleanup your system and free up disk space]'
   echo 'patcher -ps [show the command to patch a certain vulnebility]'
   echo 'patcher kernel [display the kernel you are currently using]'
   echo "patcher devs [patcher development team list]"
}

if [ "$opt" = "-s" ];then
        if [ $kernel = "4.8.3" ] || [ $kernel = "4.8.4" ] || [ $kernel = "4.8.5" ] || [ $kernel = "4.8.6" ] || [ $kernel = "4.8.7" ];then 
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2016-5195"
        elif [ $kernel = "5.13" ] || [ $kernel = "5.14.01" ] || [ $kernel = "5.8" ] || [ $kernel = "5.9" ] || [ $kernel = "5.10" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2022-0847"
        elif [ $kernel = "5.13" ] || [ $kernel = "5.13.1" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
                echo "CVE-2022-0742"
                echo "CVE-2022-0847"
    # Kernels in which CVE-2022-0847 is patched
        elif [ $kernel = "5.15.25" ] || [ $kernel = "5.10.102" ] || [ $kernel = "5.16.11" ];then
                echo "patcher-db did not find any vulnebilities for Linux kernel version $kernel"
        else
                echo "patcher-db did not find any vulnebilities for Linux kernel version $kernel"
        fi

elif [ "$opt" = "-v" ];then
        echo "Patcher version $version"

elif [ "$opt" = "-h" ];then
        help_menu
# Print the endpoint kernel
elif [ "$opt" = "kernel" ];then
        host_kernel=$(uname -rs) # Get the name & version of the kernel
        host_arch=$(uname -m) # Get the CPU's rchitecure
        echo "Endpoint kernel: $host_kernel"
        echo "Endpoint architecture: $host_arch"
elif [ "$opt" = "-ps" ];then
    echo "Enter the vuln's CVE id: "
    read vuln
    if [ $vuln = "CVE-2022-0847" ]
    then
        echo 'Run the following command as root:'
        echo 'sysctl kernel.unprivileged_bpf_disabled=1 && sysctl kernel.unprivileged_clone=0 && sysctl lvm.unprivileged_userfualtfd=0 && sysctl -p'
    else
        echo 'Error please enter a valid CVE id'
    fi
elif [ "$opt" = "devs" ];then
    echo 'Patcher development team:'
    echo '1. Venkatesh Mishra (head developer)'
    echo "See patcher's source code at: https://github.com/Emph-Inc/patcher"
    echo "patcher's official website: https://emph-inc.github.io/patcher"
elif [ "$opt" = "-c" ];then
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
else
        echo "Error please enter a valid argument (use patcher -h to see available arguments)"
fi
