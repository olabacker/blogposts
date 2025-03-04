Commands cheat sheet for linux | [linux]

# File commands

```sh
ls # List files in directory
ls -l # List files in directory with details
ls -a # List files in directory including hidden files
cd /path/to/directory # Change directory
pwd # Print working directory
mkdir /path/to/directory # Create directory
rmdir /path/to/directory # Remove directory
rm /path/to/file # Remove file
rm -r /path/to/directory # Remove directory and contents
touch /path/to/file # Create file
cp /path/to/file /path/to/destination # Copy file
mv /path/to/file /path/to/destination # Move file
cat /path/to/file # Show file contents
less /path/to/file # Show file contents with paging
more /path/to/file # Show file contents with paging
head /path/to/file # Show first lines of file
tail /path/to/file # Show last lines of file
```

# SSH

```sh	
ssh user@host # Connect to host
ssh user@host -L 3307:localhost:3306 # Connect to host with port forwarding
ssh -i /path/to/key user@host # Connect to host with key  
```

# Searching

```sh
grep pattern files # Search for pattern in files
grep -r pattern /path/to/directory # Search for pattern in directory
find /path/to/directory -name "pattern" # Find files in directory
locate pattern # Locate files with pattern
```

# Network

```sh
ifconfig # Show network interfaces
ping host # Ping host
whois domain # Get whois information
dig domain # Get DNS information
nslookup domain # Get DNS information
traceroute host # Trace route to host
netstat -tulnp # Show listening ports and applications
```

# System information

```sh
uname -a # Show system information
df -h # Show disk usage
du -h /path/to/directory # Show directory disk usage
free -m # Show memory usage
top # Show running processes
man command # Show manual for command
echo "Hello, World!" # Print text
date # Show current date and time
cal # Show calendar
uptime # Show uptime
```

# Archiving

```sh
tar -cvf archive.tar /path/to/directory # Create tar archive
tar -xvf archive.tar # Extract tar archive
gzip file # Compress file
gunzip file # Decompress file
```

# Process management

```sh
jobs # Show running jobs
fg %1 # Bring job to foreground
bg %1 # Continue job in background
disown %1 # Disown job
kill %1 # Kill job
fuser -k 8080/tcp # Kill process on port
pkill -f "processname" # Kill process by name
kill -9 [id] # Kill process by id
crontab -e # Add process to startup
@reboot [command] # Add process to startup
``` 

