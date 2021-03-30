:: Run as administrator!!
:: Stopping HyperV (To run VirtualBox but NOT docker)
bcdedit /set hypervisorlaunchtype off
:: Restart
shutdown -t 10 -r -f