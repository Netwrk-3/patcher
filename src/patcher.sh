# Copyright (c) 2022 Venkatesh Mishra. All rights reserved
#!/bin/bash

opt=$1
kernel=$2
cve_2022_0847=5.16.11
cve_2016_5195=4.9
cve_2022_0742=5.14
version="0.1.6-beta"

compare() (IFS=" "
  exec awk "BEGIN{if (!($*)) exit(1)}"
)

help_menu () {
   echo 'patcher -s [scan a kernel version for vulnebilities]'
   echo 'patcher -v [print the version of patcher]'
   echo 'patcher -h [print the help menu]'
   echo 'patcher kernel [display the kernel you are currently using]'
}

if [ "$opt" = "-s" ]
then
	#if [ $kernel -lt $cve_2022_0847 ] || [ $kernel -lt $cve_2016_5195 ]
	#if [[ $kernel \< $cve_2022_0847 || $kernel \< $cve_2016_5195 ]]
	if compare "$kernel < $cve_2016_5195"
	then 
		echo "Scanning Linux kernel version $kernel for vulnerabilities"
		sleep 2
		echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
		echo "CVE-2016-5195"
	elif compare "$kernel < $cve_2022_0847" || compare "$kernel > 5.8"
	then
		echo "Scanning Linux kernel version $kernel for vulnerabilities"
		sleep 2
		echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
		echo "CVE-2022-0847"
	elif compare "$kernel < $cve_2022_0742"
	then
		echo "Scanning Linux kernel version $kernel for vulnerabilities"
		sleep 2
		echo "Kernel verison $kernel is vulnerable to the following vulnerablilities: "
		echo "CVE-2022-0847"
		echo "CVE-2022-0742"
	elif [ $kernel == 5.15.25 ] || [ $kernel = 5.10.102 ] || [ $kernel = 5.16.11 ]
	then
		echo "Scanning Linux kernel version $kernel for vulnerabilities"
		sleep 2
		echo "$kernel is secure"
	else
		echo "Scanning Linux kernel version $kernel for vulnerabilities"
		sleep 2
		echo "$kernel is secure"
	fi

elif [ "$opt" = "-v" ]
then
	echo "Patcher version $version"

elif [ "$opt" = "-h" ]
then
	help_menu
elif [ "$opt" = "kernel" ]
then
	
	host_kernel=$(uname -rsm)
	echo "Endpoint kernel: $host_kernel"
else
	echo "Error please enter a valid argument (use patcher -h to see available arguments)"
fi
