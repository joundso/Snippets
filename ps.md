# Powershell / CMD commands

- [Powershell / CMD commands](#powershell--cmd-commands)
  - [Extract .msi from .exe file](#extract-msi-from-exe-file)
  - [Run `.sh` script using git-bash from cmd or PowerShell](#run-sh-script-using-git-bash-from-cmd-or-powershell)

## Extract .msi from .exe file

```bash
<file.exe> /s /x /b"<target-folder>" /v"/qn"
```

([Source](https://www.codetwo.com/kb/msi-from-exe/))

## Run `.sh` script using git-bash from cmd or PowerShell

```bash
## In PowerShell run:
cmd /c '"C:\Program Files\Git\git-bash.exe" /c/Temp/test.sh'

## In cmd run:
"C:\Program Files\Git\git-bash.exe" /c/Temp/test.sh
```

Optional parameters for the git-bash might be `--login -i -c` (`-i` to indicate interactive mode, `-c` to indicate working directory).

A `test.sh` might look like this:

```bash
#!/bin/bash

echo "--> Tada! This message is from within the test.sh file. <--"
date > ./new_file.txt
```

([Source and additional information about using the windows task scheduler](https://gist.github.com/damc-dev/eb5e1aef001eef78c0f4?permalink_comment_id=3764160#gistcomment-3764160))
