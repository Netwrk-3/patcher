# Copyright (c) 2022 Venkatesh Mishra. All rights reserved
# Copyright (C) 2022 Netwrk-3, Inc. All rights reserved.
#!/bin/bash

# Patcher is written by Venkatesh Mishra (writes core features) and is currently maintaned by Netwrk-3 (update patcher-db).

opt=$1
kernel=$2
version="0.1.34-stable"
RED='\033[0;31m'
NC='\033[0m'

help_menu () {
   echo "Patcher: The ultimate Linux system maintainence and security tool." && echo 'patcher -s or patcher --scan [scan a kernel version for vulnebilities]' && echo 'patcher -v or patcher --version [print the version of patcher]' && echo 'patcher -h or patcher --help [print the help menu]' && echo 'patcher -c or patcher --clean [cleanup your system and free up disk space]' && echo 'patcher kernel [display the kernel you are currently using]' && echo "patcher ip [display your system's public ip adress]" && echo "patcher --restart [reboots your machine securely using patcher's reboot scirpt]" && echo "patcher -hr or patcher --harden [harden the endpoint linux kernel]" && echo "patcher update [update patcher to the latest stable release]" && echo "patcher devs [patcher development team list]"
}
update_Patcher() {
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
        if [[ -z $kernel_version ]]; then
            printf "${RED}[!] Error:${NC} Please provide a kernel version to scan\n"
            exit 1
        elif [ $kernel = "4.8.3" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2016-5195"
        elif [ $kernel = "5.14.01" ] || [ $kernel = "5.8" ] || [ $kernel = "5.9" ] || [ $kernel = "5.10" ] || [ $kernel = "5.12" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-0847"
        elif [ $kernel = "5.13" ] || [ $kernel = "5.13.1" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-0742" && echo "CVE-2022-0847" && echo "CVE-2021-33909"
	elif [ $kernel = "5.16.10" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-25375"
        elif [ $kernel = "4.11" ] || [ $kernel = "4.9.6" ]; then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2017-18017"
	elif [ $kernel = "5.19.17" ] || [ $kernel = "6.0.2" ]; then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-43945"
        elif [ $kernel = "2.6" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2015-8812"
        elif [ $kernel = "3.2" ] || [ $kernel = "3.13" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2016-10229"
        elif [ $kernel = "3.13.6" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2014-2523"
        elif [ $kernel = "4.8.13" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2016-10150"
        elif [ $kernel = "2.6.34" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2010-252"
        elif [ $kernel = "4.3" ] || [ $kernel = "4.2" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2017-13715"
        elif [ $kernel = "4.5.2" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2016-7117"
        elif [ $kernel = "2.6.8" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2009-0065"
        elif [ $kernel = "4.4" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2015-8787"
        elif [ $kernel = "5.17.3" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-29582"
        elif [ $kernel = "5.17.2" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-28893"
        elif [ $kernel = "5.17.1" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-28390"
        elif [ $kernel = "5.4" ] || [ $kernel = "5.6.10" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-25636"
        elif [ $kernel = "5.6.12" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-27223" && echo "CVE-2022-2696"
        elif [ $kernel = "5.16.3" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-26878"
        elif [ $kernel = "5.15.14" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-23222"
        elif [ $kernel = "5.15.11" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-45469"
        elif [ $kernel = "5.15.rc-5" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-45402"
        elif [ $kernel = "5.10" ] || [ $kernel = "5.14.6" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-41073"
        elif [ $kernel = "5.13.5" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-37576"
        elif [ $kernel = "5.13.2" ] || [ $kernel = "5.13.3" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-33909"
        elif [ $kernel = "5.12.7" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-33200"
        elif [ $kernel = "5.11.12" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-29154"
        elif [ $kernel = "5.11.8" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-28972"
        elif [ $kernel = "5.11.6" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-28660" && echo "CVE-2021-28375"
        elif [ $kernel = "5.10.11" ];then
                echo "Kernel verison $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2021-3347"
        elif [ $kernel = "5.18.9" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-34918"
        elif [ $kernel = "5.18.1" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-32250"
        elif [ $kernel = "5.16.12" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-29156"
        elif [ $kernel == "5.18.4" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-36946" && echo "CVE-2022-34495" && echo "CVE-2022-34494"
        elif [ $kernel == "5.18.14" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-36879"
        elif [ $kernel == "5.18.9" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-34918"
        elif [ $kernel == "5.17.6" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-33981"
        elif [ $kernel == "5.18.3" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-32981"
        elif [ $kernel == "5.13.3" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-41222"
        elif [ $kernel == "5.19.10" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-41218"
        elif [ $kernel == "5.19.9" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40768" && echo "CVE-2022-39190"
        elif [ $kernel == "5.15.62" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40476"
        elif [ $kernel == "5.19.8" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40307"
        elif [ $kernel == "5.19" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-39842" && echo "CVE-2022-39188"
        elif [ $kernel == "5.18.4" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-36946"
	elif [ $kernel = "5.19.12" ];then
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-41850" && echo "CVE-2022-41849" && echo "CVE-2022-41848"
	elif [ $kernel = "5.13.3" ];then 
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-41222"
	elif [ $kernel = "5.19.10" ];then
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-41218"
	elif [ $kernel = "5.19.9" ];then
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40768"
	elif [ $kernel = "5.15.62" ];then
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40476"
	elif [ $kernel = "5.19.8" ];then
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40307"
	elif [ $kernel = "5.19.6" ];then
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-39190"
	elif [ $kernel = "5.18.17" ];then
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-39189"
	elif [ $kernel == "6.0.6" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-44034" && echo "CVE-2022-44033" && echo "CVE-2022-44032"
        elif [ $kernel == "5.19.15" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-43750"
        elif [ $kernel == "5.19.16" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-42722" && echo "CVE-2022-42721" && echo "CVE-2022-42720" && echo "CVE-2022-42719" && echo "CVE-2022-41674"
        elif [ $kernel == "5.19.7" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-42703"
        elif [ $kernel == "5.19.10" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-41218"
        elif [ $kernel == "5.19.9" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40768"
         elif [ $kernel == "5.15.62" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40476"
	elif [ $kernel == "5.19.8" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-40307"
	elif [ $kernel == "5.19" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-39842"
	elif [ $kernel == "5.18.17" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-39189"
	elif [ $kernel == "6.0.11" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-47521 (https://ubuntu.com/security/CVE-2022-47521)" && echo "CVE-2022-47520 (https://ubuntu.com/security/CVE-2022-47520)" && echo "CVE-2022-47519 (https://ubuntu.com/security/CVE-2022-47519)" && echo "CVE-2022-47518 (https://ubuntu.com/security/CVE-2022-47518)"
	elif [ $kernel == "6.0.10" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-45934 (https://ubuntu.com/security/CVE-2022-45934)" && echo "CVE-2022-45919 (https://ubuntu.com/security/CVE-2022-45919)"
	elif [ $kernel == "6.0.9" ];then
                echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-45888 (https://ubuntu.com/security/CVE-2022-45888)" && echo "CVE-2022-45887 (https://ubuntu.com/security/CVE-2022-45887)" && echo "CVE-2022-45886 (https://ubuntu.com/security/CVE-2022-45886)" && echo "CVE-2022-45885 (https://ubuntu.com/security/CVE-2022-45885)" && echo "CVE-2022-45884 (https://ubuntu.com/security/CVE-2022-45884)"
	elif [ $kernel == "6.1-rc6" ];then
		echo "Kernel version $kernel is vulnerable to the following vulnerablities: " && echo "CVE-2022-45869 (https://ubuntu.com/security/CVE-2022-45869)"
        else
                echo "Patcher-db did not find any vulnebilities for Linux kernel version $kernel"
        fi

elif [ "$opt" = "-v" ] || [ "$opt" = "--version" ];then
        echo "Patcher version $version"
elif [ "$opt" = "-h" ] || [ "$opt" = "--help" ];then
    help_menu
elif [ "$opt" = "kernel" ];then
        host_kernel=$(uname -rs) # Get the name & version of the kernel
        host_arch=$(uname -m) # Get the CPU's rchitecure
        echo "Endpoint kernel: $host_kernel" && echo "Endpoint architecture: $host_arch"
elif [ "$opt" = "devs" ];then
    echo 'Patcher development team:' && echo '1. Venkatesh Mishra (head developer)' && echo "See Patcher's source code at: https://github.com/Netwrk-3/patcher" && echo "patcher's official website: https://netwrk-3.github.io/patcher/"
elif [ "$opt" = "-c" ] || [ "$opt" = "--clean" ];then
        if [ "$(id -u)" -ne 0 ]; then
            printf "${RED}[!] Error:${NC} Patcher's cleanup script requires evelavted privilages!\n"
        else
            echo 'starting Patcher cleanup script.' && echo 'deleting cache files...' && rm -rf /home/$USER/.cache/* && echo 'deleting temperary files...' && rm -rf /tmp/* && rm -rf /var/tmp/* && echo 'dropping cached memory...' && echo 3 > /proc/sys/vm/drop_caches
        fi
elif [ "$opt" = "update" ];then
    update_Patcher
elif [ "$opt" = "ip" ];then
    ip=$(curl -s 'api.ipify.org') && echo "Public IP adress: $ip"
    echo "Type: IPv4"
elif [ "$opt" = "--restart" ];then
    secure_reboot
elif [ "$opt" = "-hr" ] || [ "$opt" = "--harden" ];then
   if [ "$(id -u)" -ne 0 ]; then
    printf "${RED}[!] Error:${NC} Harden your system using sudo or doas, please use either one of them and try agian\n"
   else
   	echo "Hardening your linux kernel..."
   	systctl kernel.pid_max = 65536; sysctl kernel.core_uses_pid = 1;sysctl kernel.ctrl-alt-del = 0;sysctl kernel.shmmax = 268435456;sysctl kernel.shmall = 268435456;sysctl kernel.printk=3 3 3 3;sysctl kernel.sysrq=4; sysctl kernel.kptr_restrict=2; sysctl kernel.unprivileged_bpf_disabled=1;sysctl kernel.kexec_load_disabled=1;sysctl kernel.unprivileged_userns_clone=0; sysctl kernel.perf_event_paranoid=3;sysctl  kernel.yama.ptrace_scope=2;sysctl kernel.core_uses_pid = 1 && sysctl -p
   fi
elif [ "$opt" = "-shk" ];then
    kernel=$(uname -r | cut -b 1-5) && bash Patcher.bash -s $kernel
else
    printf "${RED}[!] Error:${NC} please enter a valid argument (use Patcher -h to see valid arguments)\n"
fi
