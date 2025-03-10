Using dotnet-trace in a container | [dotnet]

Install dotnet sdk in the container 

```sh
apt-get update
apt-get install curl
curl -OL https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get install apt-transport-https
apt-get update
apt-get install dotnet-sdk-9.0
```

Install the dotnet trace tool

```sh
dotnet tool install --global dotnet-trace
```

Run the trace tool. It isnt reachable with 'dotnet-trace' so you have to use the full path..

```sh
~/.dotnet/tools/dotnet-trace ps
~/.dotnet/tools/dotnet trace collect -p 1 -o trace.nettrace
```

Copy the trace file to the host, exit the container and run

```sh
docker cp <containerId>:/app/trace.nettrace .
```

Convert the trace file to speedscope format

```sh
dotnet-trace convert .\trace.nettrace --format speedscope -o trace.json
```



