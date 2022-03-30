Commands for setting ip address manually and opening ports 🐧

# Setting manual ip address

Start by finding out which interface to target and replace further occurences of [eth] with your own.

```ps
nmcli
```


Firstly, we need to change the IPv4 configuration mode on the chosen interface to 'Manual'.

```ps
nmcli con mod [eth] ipv4.method manual
```
Now change the IP address and the gateway with the new IP address.
```ps
nmcli con mod [eth] ipv4.address 192.168.10.100/24
nmcli con mod [eth] ipv4.gateway 192.168.10.1
```
Update the DNS server with your own.
```ps
nmcli con mod [eth] ipv4.dns "1.1.1.1 192.168.10.1"
```
And enable the '[eth]' interface to start automatically on the system boot.
```ps
nmcli con mod [eth] autoconnect yes
```
After that, restart the '[eth]' interface.
```ps
nmcli con down [eth]
nmcli con up [eth]
```

Lastly, check the interface information with 
```ps
nmcli device show [eth]
```

# Open ports in firewall 🚪🔥🧱

Command for opening ports 

```ps
firewall-cmd --zone=public --permanent --add-port 7946/tcp
```

Make sure the firewall gets reloaded to get the newly added rules activated

```
firewall-cmd --reload
```

# Hostname

## View hostname

The command `hostnamectl` prints some information about the host

```yml
 Static hostname: [hostname]
       Icon name: computer-vm
         Chassis: vm
      Machine ID: fa3ca53253sf4211839e52e60f8605be
         Boot ID: 3462756asfa463ceb91dd2b99b5b39d8
  Virtualization: vmware
Operating System: CentOS Stream 9
     CPE OS Name: cpe:/o:centos:centos:9
          Kernel: Linux 5.14.0-55.el9.x86_64
    Architecture: x86-64
 Hardware Vendor: VMware, Inc.
  Hardware Model: VMware Virtual Platform
```

## Set hostname

Set the hostname to what you like with the following command.

```ps
hostnamectl set-hostname '[new hostname]'
```