# Mount Remote Drive with SSHFS

1. Install the latest stable installer of [WinFSP](https://github.com/billziss-gh/winfsp/releases)
2. Install the latest stable installer of [SSHFS-Win](https://github.com/billziss-gh/sshfs-win/releases)
3. Open `File Explorer`, right-click on `This PC` and choose `Map network drive`. Choose a drive to mount at and enter the following in the folder field:

```console
\\sshfs\[your_login_name]@graham.sharcnet.ca
```

4. Ensure you check the box `Connect using different credentials` if your computer login password is different from Sharcnet.

<p align="center">
  <img width="400" src="img/map_network_sshfs.png">
</p>

5. You should then see the network drive in your file explorer!

<p align="center">
  <img width="400" src="img/drive_directory.png">
</p>

