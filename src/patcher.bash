# Copyright (c) 2022 Venkatesh Mishra. All rights reserved
#!/bin/bash

opt=$1
kernel=$2
version="0.1.9-beta"

help_menu () {
   echo 'patcher -s [scan a kernel version for vulnebilities]'
   echo 'patcher -v [print the version of patcher]'
   echo 'patcher -h [print the help menu]'
   echo 'patcher -ps [show the command to patch a certain vulnebility]'
   echo 'patcher kernel [display the kernel you are currently using]'
}

if [ "$opt" = "-s" ]
then
	if [ $kernel = "4.8.3" ] || [ $kernel = "4.8.4" ] || [ $kernel = "4.8.5" ] || [ $kernel = "4.8.6" ] || [ $kernel = "4.8.7" ]
	then 
		echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
		echo "CVE-2016-5195"
	elif [ $kernel = "5.14.01" ] || [ $kernel = "5.8" ] || [ $kernel = "5.9" ] || [ $kernel = "5.10" ]
	then
		echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
		echo "CVE-2022-0847"
	elif [ $kernel = "5.13" ] || [ $kernel = "5.13.1" ]
	then
		echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
		echo "CVE-2022-0742"
    # Kernels in which CVE-2022-0847 is patched
    elif [ $kernel = "5.15.25" ] || [ $kernel = "5.10.102" ] || [ $kernel = "5.16.11" ]
    then
        echo "$kernel is secure"
	else
		echo "$kernel is secure"
	fi

elif [ "$opt" = "-v" ]
then
	echo "Patcher version $version"

elif [ "$opt" = "-h" ]
then
	help_menu
# Print the endpoint kernel
elif [ "$opt" = "kernel" ]
then
	host_kernel=$(uname -rs)
    host_arch=$(uname -m)
	echo "Endpoint kernel: $host_kernel"
    echo "Endpoint architecture: $host_arch"
elif [ $opt = "-ps" ]
then
    #vuln=$1
    echo "Enter the vuln's CVE id: "
    read vuln
    if [ $vuln = "CVE-2022-0847" ]
    then
        echo 'Run the following command as root:'
        echo 'sysctl kernel.unprivileged_bpf_disabled=1 && sysctl kernel.unprivileged_clone=0 && sysctl lvm.unprivileged_userfualtfd=0 && sysctl -p'
    else
        echo 'Error please enter a valid CVE id'
    fi
else
	echo "Error please enter a valid argument (use patcher -h to see available arguments)"
fi
