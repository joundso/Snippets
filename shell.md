# Shell Snippets

- [Shell Snippets](#shell-snippets)
  - [Nano: Mark all](#nano-mark-all)
  - [SSH: Connect with path to keyfile](#ssh-connect-with-path-to-keyfile)

## Nano: Mark all

1. Place the cursor at the beginning of the file
2. `Ctr + 6` to set a mark
3. `Alt + Shift + T` (or try `Alt + T`) to cut to the end of the file
4. If `Alt + T` doesn't work, try `Ctrl + K`
5. To just copy the file content do `Ctrl + U` to uncut the text again

## SSH

### Connect with path to keyfile

```bash
ssh -i /drive/path/file user@server
```

### Create new SSH key

```bash
ssh-keygen -o
```

### Upload new SSH key to remote server

On the local machine run:

```bash
ssh-copy-id -i ~/.ssh/mykey user@host_or_ip
```

### Remote files for SSH configuration

```bash
## Allow connection with Password to insert new SSH key on remote:
sudo nano /etc/ssh/sshd_config
## Change `PasswordAuthentication no` to `PasswordAuthentication yes`
## CTRL + X (exit) --> y (yes) --> Enter (save)

## Restart SSH services:
sudo service ssh restart
sudo service sshd restart

## Here upload the new SSH key from the local machine.
## After the new SSH key is inserted on the remote machine,
## disable password authentification again:
sudo nano /etc/ssh/sshd_config
## Change `PasswordAuthentication yes` to `PasswordAuthentication no`
## CTRL + X (exit) --> y (yes) --> Enter (save)

## Restart SSH services:
sudo service ssh restart
sudo service sshd restart

exit
```
