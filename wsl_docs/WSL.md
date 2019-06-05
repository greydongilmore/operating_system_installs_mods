# Activating Windows Linux Subsystem (WSL)
## Turn on linux subsystem feature
Open Windows PowerShell as administrator and run the command:

```console
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Restart your computer when prompted.

## Download the linux distro
1. Open the Microsoft Store and choose your favorite Linux distribution by searching for them (I prefer Ubuntu):
- [Ubuntu](https://www.microsoft.com/en-ca/p/ubuntu/9nblggh4msv6?rtc=1&activetab=pivot:overviewtab)
- [Debian](https://www.microsoft.com/en-ca/p/debian/9msvkqc78pk6?rtc=1&activetab=pivot:overviewtab)

2. From the distro's page, select "Get".

3. To complete the initialization of your newly installed distro, launch a new instance by searching in the Start menu and launching the distro. 

4. The first time a newly installed distro runs, a Console window will open, and you'll be asked to wait for a minute or two for the installation to complete.

5. Once installation is complete, you will be prompted to create a new user account (and its password).

6. Most distros ship with an empty/minimal package catalog. I strongly recommend regularly updating your package catalog, and upgrading your installed packages using your distro's preferred package manager.

```console
sudo apt update && sudo apt upgrade
```

## Add link to the linux subsystem in Windows Quick Access
Depending on the version of linux you installed, the absolute path will be found either:

1. ```C:\Users\*[your_username]*\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_*[unique_code]*\LocalState\rootfs```
2. ```C:\Users\*[your_username]*\AppData\Local\lxss```

When you find the correct location, right click on the parent folder and select 'Pin to Quick Access'
