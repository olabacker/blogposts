Docker restrict log size | [docker] [log]

To restrict the size of the log files created by docker, add the following to the daemon.json file located in `/etc/docker/daemon.json`.

```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
```