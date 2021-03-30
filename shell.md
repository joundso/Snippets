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

## SSH: Connect with path to keyfile

```bash
ssh -i /drive/path/file user@server
```
