# SSHFS Desktop Application

## Create Shell Script

1. Run the following command to create an empty shell script:

```console
gedit ~/Documents/sshfs_mount.sh
chmod +x ~/Documents/sshfs_mount.sh
```

2. Enter the command you normally run to connect to the remote server, change `mount_dir` to match your local mount location:

```
#!/bin/bash
mount_dir = /home/greydon/graham
if (! mountpoint -q mount_dir ); then
    sshfs gilmoreg@graham.computecanada.ca:/home/[USER]/ mount_dir -o   ServerAliveInterval=15,ServerAliveCountMax=3,Compression=no,follow_symlinks
else
    umount mount_dir
fi
```

3. In the script, the filesystem will be mounted/unmounted depending on the status. Save and close the file.

## Create Desktop Entry File

1. Run the following command to create an empty shell script:

```console
gedit ~/Documents/sshfs_mount.desktop
chmod +x ~/Documents/sshfs_mount.desktop
```

2. Paste the following into the document, ensure you update the brackets:

```
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Icon=[path/to/icon]
Name=[Name the application]
Exec=[path/to/sshfs_mount.sh]
```

3. Save and close.

4. Move the desktop entry file into the applications directory:

```console
sudo mv ~/Documents/sshfs_mount.desktop /usr/share/applications/
```

5. Search in applications for the desktop entry file, right-click and add to favorites.
