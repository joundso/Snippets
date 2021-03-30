:: Run as administrator!!
:: StartingHyperV (To run Docker but NOT VirtualBox)
bcdedit /set hypervisorlaunchtype auto
:: Restart
shutdown -t 10 -r -f