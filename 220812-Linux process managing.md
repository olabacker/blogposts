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