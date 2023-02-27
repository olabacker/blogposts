Commands for basic process managing in linux | [linux]

## Detach/reattach process in linux

If you have a command running, press Ctrl + Z on your keyboard to stop the process.

After stopped processes can be viewed with the `jobs` command

```sh
jobs
```

To bring a job back to the foreground, we can use the `fg` command. If multiple jobs exist, the id must be specified with `%[id]`

```sh
fg %1
```

To continue running a stopped process in the background, we can use `bg`. If multiple jobs exist, the id must be specified with `%[id]`

```sh
bg %1
```

If the current terminal is closed, however, the processes will close. To prevent this from happening, we can disown the process with `disown`. If multiple jobs exist, the id must be specified with `%[id]`.

```sh
disown %1
```

This will remove the process from the jobs command but it can instead be found using `ps` instead.

## Kill process in linux

To kill a process, we can use the `kill` command. If multiple jobs exist, the id must be specified with `%[id]`.

```sh
kill %1
```

## Kill process on port

If a process is running on a specific port, we can kill it with the `fuser` command.

```sh
fuser -k 8080/tcp
```

## Kill process by name

If a process is running with a specific name, we can kill it with the `pkill` command.

```sh
pkill -f "processname"
```

## Kill process by id

If a process is running with a specific id, we can kill it with the `kill` command.

```sh
kill -9 [id]
```


## Add a process to startup

To add a process to startup, we can use the `crontab` command.

```sh
crontab -e
```

This will open the crontab file in the default editor. To add a process to startup, we can add the following line to the file.

```sh
@reboot [command]
```