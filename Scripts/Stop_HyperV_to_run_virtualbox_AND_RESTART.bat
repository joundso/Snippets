:: THIS WILL REBOOT YOUR SYSTEM!
:: Run as administrator!
:: Stopping HyperV (To run VirtualBox but NOT docker)
bcdedit /set hypervisorlaunchtype off
:: Restart
shutdown -t 60 -r -f