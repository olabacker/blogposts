Commands for setting ip address manually

Start by finding out which interface to target and replace further occurences of [eth] with your own.

```ps
nmcli
```


Firstly, we need to change the IPv4 configuration mode on the chosen interface to 'Manual'.

```ps
nmcli con mod [eth] ipv4.method manual

Now change the IP address and the gateway with the new IP address.
```ps
nmcli con mod [eth] ipv4.address 192.168.10.100/24
nmcli con mod [eth] ipv4.gateway 192.168.10.1

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