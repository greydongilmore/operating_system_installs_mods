# Activating Windows Linux Subsystem 2 (WSL2)
## Sign up for Windows Insider program
- Go to [Register for Windows Insider](https://insider.windows.com/en-us/getting-started/)
- Sign up for Windows Insider program

## Activate Windows Insider Builds
1. Enable Full Diagnostic Data
    - go to Settings --> Privacy --> Diagnostics & feedback --> Diagnostic data
    - Choose `Full` as the option
2. Enable Telemetry Data via Registry
    - Open Registry Editor
        + Press Windows Key + R then type `regedit` to open registry editor
    - Navigate to:

    ```console
    HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection
    ```

    - Right-click `DataCollection`, click `New` and then click `DWORD (32-bit) Value`
    - Name it as  `AllowTelemetry`, and then press `ENTER`
    - Double-click `AllowTelemetry`, set the value as 3, and then click OK.

<p align="center">
  <img width="500" src="img/regedit_telemetry.png">
</p>

    - Repeat the above steps for:

    ```console
    HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\DataCollection
    ```

    - Restart your computer

3. Group Policy to enable Telemetry
    - Press Windows key + r and type `gpedit.msc` in the Run prompt, hit ENTER to launch group policy editor
    - Go to Computer Configuration --> Administrative Templates --> Windows Components --> Data Collection and Preview Builds
    - Double-click Allow Telemetry
    - In the Options box, configure the level as 3, and then click OK

<p align="center">
  <img width="500" src="img/group_telemetry.png">
</p>
    
## Turn on linux subsystem feature
1. Open Windows PowerShell as administrator and run the commands:

    ```console
    Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    ```

2. You will need to restart your computer again

## Download the linux distro
1. Open the Microsoft Store and choose your favorite Linux distribution by searching for them (I prefer Ubuntu):
    * [Ubuntu](https://www.microsoft.com/en-ca/p/ubuntu/9nblggh4msv6?rtc=1&activetab=pivot:overviewtab)
    * [Debian](https://www.microsoft.com/en-ca/p/debian/9msvkqc78pk6?rtc=1&activetab=pivot:overviewtab)

2. From the distro's page, select "Get".

3. To complete the initialization of your newly installed distro, launch a new instance by searching in the Start menu and launching the distro. 

4. The first time a newly installed distro runs, a Console window will open, and you'll be asked to wait for a minute or two for the installation to complete.

5. Once installation is complete, you will be prompted to create a new user account (and its password).

6. Most distros ship with an empty/minimal package catalog. I strongly recommend regularly updating your package catalog, and upgrading your installed packages using your distro's preferred package manager.

      ```console
      sudo apt update && sudo apt upgrade
      ```

