Useful git stuff | [git]

## Log alias

This alias will give a nice log output with the commit hash, branch and date.

```sh
git config --global alias.lg "log --pretty='%C(bold red)%h%Creset%C(bold yellow)%d%Creset %s %C(cyan) (%ar)%Creset'"
```
