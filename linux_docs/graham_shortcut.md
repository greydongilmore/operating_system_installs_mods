#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Icon=/home/greydon/Pictures/sharcnet.ico
Name=Graham
Exec=sshfs gilmoreg@graham.computecanada.ca:/home/gilmoreg/ /home/greydon/Documents/graham -o ServerAliveInterval=15,ServerAliveCountMax=3,Compression=no,follow_symlinks