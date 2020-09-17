# SADA IP ADDRESS PING
# Summary

This bash script does those following:
1- List information on all network devices on your machine. IP addresses, link-level addresses, network masks, etc. per network device on your machine.
2- Let you pick one of the network devices
3- Calculate the network and the cidr 
4- Use Nmap to ping each devices in the list to see if it's up or down

# How to use it

This bash script requires NMap to be able to ping each devices. The native ping tool would have taken too much time. Nmap comes preinstalled in a lot of linux distros but if it's not installed please install by following this link https://phoenixnap.com/kb/how-to-install-use-nmap-scanning-linux.

Clone the repository
```bash
git clone https://github.com/highlloyd/SADA.git && cd SADA/
```
Make the script executable
```bash
chmod u+x run.sh
```
Run the script
```bash
./run.sh
```
The script will print the list of available physical network devices and will ask you to choose one of them. 

# What this template project contains
This project contains the run.sh file.
