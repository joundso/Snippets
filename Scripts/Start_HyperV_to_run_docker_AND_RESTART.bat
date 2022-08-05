:: THIS WILL REBOOT YOUR SYSTEM!
:: Run as administrator!
:: StartingHyperV (To run Docker but NOT VirtualBox)
bcdedit /set hypervisorlaunchtype auto
:: Restart
shutdown -t 60 -r -f