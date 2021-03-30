# Snippets for Visual Studio Code

- [Snippets for Visual Studio Code](#snippets-for-visual-studio-code)
  - [List all installed Plugins](#list-all-installed-plugins)
  - [Extensions are located here](#extensions-are-located-here)

## List all installed Plugins

See [here](https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list) for further information.

```bash
code --list-extensions | xargs -L 1 echo code --install-extension
```

:bulb: If you want to sync your extensions to another instance of VSCode, haeve a look at the plugin [`Settings Sync`](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) or [read this question on Stackoverflow](https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list).

## Extensions are located here

- Windows: `%USERPROFILE%\.vscode\extensions`
- Mac: `~/.vscode/extensions`
- Linux: `~/.vscode/extensions`
