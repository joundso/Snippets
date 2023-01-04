# Linux Shell Snippets

- [Linux Shell Snippets](#linux-shell-snippets)
  - [Nano: Mark all](#nano-mark-all)
  - [SSH](#ssh)
    - [Connect with path to keyfile](#connect-with-path-to-keyfile)
    - [Create new SSH key](#create-new-ssh-key)
    - [Upload new SSH key to remote server](#upload-new-ssh-key-to-remote-server)
    - [Remote files for SSH configuration](#remote-files-for-ssh-configuration)
  - [Create text-tree of folder structure](#create-text-tree-of-folder-structure)
    - [Install `tree` for git-bash using Windows](#install-tree-for-git-bash-using-windows)

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

## Create text-tree of folder structure

```bash
## Folders only:
tree -d /path/to/folder/

## Folders and files:
tree /path/to/folder/

## Flags (source: https://linux.die.net/man/1/tree):
## -d     directories only
## -L #   Recursion depth (replace `#` with a number)
## -C     Add color to the output
```

### Install `tree` for git-bash using Windows

--> <https://dev.to/flyingduck92/add-tree-to-git-bash-on-windows-10-1eb1>
