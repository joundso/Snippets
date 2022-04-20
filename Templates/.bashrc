# Why all content is outsourced to .custom_aliases?
# If you set it up like this:
# 1. Clone this repo to some path (e.g. `/opt/Snippets`)
# 2. Copy this .bashrc file to your bash root `~` and
#    adjust the PATH_TO_CUSTOM_BASHRC to the file `.custom_aliases`
#    (e.g. `/opt/Snippets/Templates/.custom_aliases`)
# 3. Restart your console.
# 
# It simply makes using the same version-controlled bashrc file easy across systems,
# because you only need to pull the latest changes e.g in `/opt/Snippets` and run `updatecustomaliases`
# (Hint: This command is defined also within `.custom_aliases`).
# Otherwise you would need to somehow integrate the repo into your root and rename to .custom_aliases
# to have it versioned and working.

PATH_TO_CUSTOM_BASHRC=~/.custom_aliases

if [ -f ${PATH_TO_CUSTOM_BASHRC} ]; then
    . ${PATH_TO_CUSTOM_BASHRC}
fi