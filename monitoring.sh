#!/bin/bash

# The architecture of operating system and its kernel version.
arc=$(echo -n "#Architecture: " ;\
	uname -a)

# The number of physical processors.
cpup=$(echo -n "#CPU physical : " ;\
	grep "physical id" /proc/cpuinfo | sort -u | wc -l)

# The number of virtual processors.
vcpu=$(echo -n "#vCPU : " ;\
	grep processor /proc/cpuinfo | wc -l)

# The current available RAM on server and its utilization rate as a percentage.
mem=$(echo -n "#Memory Usage: " ;\
	free -m | grep Mem | awk '{printf("%d/%dMB (%3.2f%%)\n",$3,$2,$3/$2*100)}')

# The current available memory on server and its utilization rate as a percentage.
disk=$(echo -n "#Disk Usage: " ;\
	df -h --total | grep total | tr -d "G" | awk '{printf("%.1f/%.0fGb (%d%%)\n",$3,$2,$5)}')

# The current utilization rate of processors as a percentage.
cpul=$(echo -n "#Cpu load: " ;\
	top -bn 1 | grep Cpu | sed -e 's/^.*ni,//' -e 's/id.*$//' | awk '{printf("%.1f%%\n", 100.0-$1)}')

# The date and time of the last reboot.
lboot=$(echo -n "#Last boot: " ;\
	last reboot --time-format iso | head -n 1 | awk '{printf("%s\n",$5)}' | sed -e 's/.\{9\}$//' -e 's/T/ /')

# Whether LVM is active or not.
lvm=$(echo -n "#LVM use: " ;\
	test $'(lvdisplay | grep available | wc -l)' != 0 && echo yes || echo no)

# The number of active connections.
tcp=$(echo -n "#Connexions TCP : " ;\
	ss -t | grep ESTAB | wc -l | awk '{printf("%d ESTABLISHED\n",$1)}')

# The number of users using the server.
ulog=$(echo -n "#User log: " ;\
	users | wc -w)

# The IPv4 address of server and its MAC (Media Access Control) address.
ip=$(echo -n "#Network: IP " ;\
	hostname -I | awk '{printf("%s ",$1)}' ; ip a | grep ether | awk '{printf("(%s)\n",$2)}')

# The number of commands executed with the sudo program.
sudo=$(echo -n "#Sudo : " ;\
	cat /var/log/sudo/sudo_log | grep COMMAND | wc -l | awk '{printf("%d cmd\n",$1)}')

all=$(echo -e "    $arc\n    $cpup\n    $vcpu\n    $mem\n    $disk\n    $cpul\n    $lboot\n    $lvm\n    $tcp\n    $ulog\n    $ip\n    $sudo")

wall "$all"
