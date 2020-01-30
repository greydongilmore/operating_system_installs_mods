# Install Terminator Linux Emulator
## Installing an X Server
To run an X Window application, you will need to have an X Server installed and running on your Windows 10 machine. The most popular application is: [VcXsrv](https://sourceforge.net/projects/vcxsrv/)

After installing, VcXsrv creates a desktop shortcut. To start the server in multi-window mode run the following command in a command prompt:

```console
"C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto
```

## Configuring Terminator
Once VcXsrv is installed, the next step is to install Terminator on WSL Bash:

```console
sudo apt-get install terminator
```

Terminator will not initalize a config file so you will need to do this manually:

```console
mkdir -p ~/.config/terminator
touch ~/.config/terminator/config
```

Try launching Terminator by specifying the X Display to connect to (:0) in the linux shell:

```console
DISPLAY=:0 terminator &
```

If you receive an error about D-Bus (```No D-BUS daemon running```) then press `CTRL+C` to abort the previous command and run the following:

```console
sudo apt-get install dbus-x11
sudo service dbus start
```

Once you have completed the above run the previous command again:

```console
DISPLAY=:0 terminator &
```

A nice Terminator window should pop up.

## Installing Zsh

The next step is to install Zsh with oh-my-zsh. Installation is straightfoward:

```console
sudo apt-get install curl wget git zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
```
You may receive a message `Password: chsh: PAM: Authentication failure` you can ignore this.

Set the theme to "ys" at line 11 by replacing `robbyrussell` in ```.zshrc```:

```console
vi ~/.zshrc
```

```
ZSH_THEME="ys"
```

If you have never used `vi` editor before, you will need to press the `i` key to enter inout mode to make changes. Once you have made the change you will need to exit input mode by pressing `esc`. In order to exit the editor and save you need to press `:` followed by `wq` to exit the editor with save.

The only problem with Bash in WSL is it will always run Bash instead of Zsh. To get around that, add this to the end of your `~/.bashrc` which will launch zsh instead when it starts up:

```console
vi ~/.bashrc
```

```
if [ -t 1 ]; then
  exec zsh
fi
```

## Terminator Colorscheme

The next thing is to change the default Terminator colorscheme to Solarized Dark. The easiest way to do this, is to use the awesome node package [base16-builder](https://github.com/base16-builder/base16-builder). You need to first install Node.js:

```console
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs
```

Once you have installed Node.js you can then run the base-16builder install:

```console
sudo npm install --global base16-builder
```

You need to change directory access to the `configstore` directory just created:

```console
sudo chown -R [your_username] /home/[your_username]/.config/configstore
```

Now you need to apply the scheme to the terminator config file:

```console
mkdir -p .config/terminator
base16-builder -s solarized -t terminator -b dark > .config/terminator/config
```

## Dircolors

To change the dircolors you can use [Solarized dircolors](https://github.com/seebi/dircolors-solarized) on Github and downloaded them to ```.dir_colors```:

```console
wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark
mv dircolors.256dark .dir_colors
```

Finally, added this to your ```.zshrc``` to eval the Solarized dircolors on startup:

```console
if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi
```

## Launching Terminator Directly
To launch a hidden command window using the WShell Object in VBS you need to type the folowing script into a text document. 

Right click on your desktop and create a new text doc. Then copy the following and save the file with the .vbs extension (e.g. startTerminator.vbs):

```
args = "-c" & " -l " & """DISPLAY=:0 terminator"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0
```

Move this ```.vbs``` file into a safe place such as "C:\Users\[your_username]". Right click on the file and 'Send to' the desktop as a shortcut. Right click on the new shortcut and select properties. In the 'Target' field type:

```
C:\Windows\System32\wscript.exe C:\Users\*[your_username]*\startTerminator.vbs
```

Click 'Apply'. You can then set the icon of the shortcut by saving [this icon file](https://www.google.com/imgres?imgurl=http://www.iconarchive.com/download/i89875/alecive/flatwoken/Apps-Terminator.ico&imgrefurl=http://www.iconarchive.com/show/flatwoken-icons-by-alecive/Apps-Terminator-icon.html&docid=q0xx5aXq6WGXIM&tbnid=izoeFerwzIqyVM:&vet=1&w=256&h=256&source=sh/x/im) to the same place you saved the ```.vbs``` file. Right click on the shortcut again, properties and at the bottom select 'Change Icon...'. From here you can select the icon file you just downloaded. 

In the 'Start in' field type:

```
%USERPROFILE%
```

It's impossible to have Termiator start in your Linux home directory through this method since that path is not "known" to Windows. To get around it, add this to your .zshrc so it CD's to your home directory on startup:

```console
vi ~/.zshrc
```

```
if [ -t 1 ]; then
  cd ~
fi
```

## Other customizations

If you want to further modify your terminator theme you can add lines to the file ```~/.config/terminator/config```.

To change the opening size of the terminal window add the variable ```size``` under layouts:

```console
vi ~/.config/terminator/config
```

```
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      profile = Base16 Solarized Dark
      type = Terminal
    [[[window0]]]
      parent = ""
      size = 1594, 465
      type = Window
```

Close terminator and re-open.
