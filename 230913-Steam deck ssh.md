Enable ssh on steam deck to enable remote access | [steamdeck]

So I want to be able to ssh into my steam deck to configure some stuff. To do it directly on the deck is a bit cumbersome so I want to be able to do it from my computer.


## Set password

First thing is to enter desktop mode and set a password for the default user `deck`.

```bash
passwd
```

## Enable ssh

Ssh is already installed but it is not enabled. To enable it you need to run the following commands.

```bash
systemctl enable sshd
systemctl start sshd
```

## Enjoy ssh

Now you can ssh into your steam deck and download game saves and other stuff.

```bash
ssh deck@*host*
```

