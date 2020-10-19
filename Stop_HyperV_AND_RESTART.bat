:: Run as administrator!!
:: Stopping HyperV (To run virtualBox)
bcdedit /set hypervisorlaunchtype off
:: Restart
shutdown -t 10 -r -f