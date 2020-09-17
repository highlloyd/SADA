#!/bin/bash
#Ifconfig is a bash tool to show network information
ifconfig -a
#Save all the LAN connected network devices and save it to the variable ndevices
ndevices=$(ls /sys/class/net | grep -i 'eth\|wl')
echo "This is the list of devices connected to your LAN please choose one: $ndevices"
#Get the device that the user want to use
read nchoice
#Verify if the user choice is good or not
if echo $ndevices | grep -w $nchoice > /dev/null; then
    #get the IP address and the netmask of the network device
    mask=$(ifconfig $nchoice | awk '/netmask/{ print $4;}')
    ip=$(ip addr show $nchoice | grep -Po 'inet \K[\d.]+')
    IFS=. read -r i1 i2 i3 i4 <<< "$ip"
    IFS=. read -r m1 m2 m3 m4 <<< "$mask"
    #calculate the network address
    network=$((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$((i4 & m4))
#Calculate the CIDR value of the netmask Address
IPprefix_by_netmask () { 
   c=0 x=0$( printf '%o' ${1//./ } )
   while [ $x -gt 0 ]; do
       let c+=$((x%2)) 'x>>=1'
   done
   echo $c ; }
cidr=$(IPprefix_by_netmask $mask)
# Ping all the ips in the network/cidr range. Also reduce the timeout to go through the list faster
nmap -n -T5 -sP $network/$cidr
else
    echo "The network name you give was not on the list"
    exit 1
fi
