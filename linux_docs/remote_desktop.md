# Google Remote Desktop

## Install Remote Desktop Extension

__1.__ Navigate to <a href="https://chrome.google.com/webstore/detail/chrome-remote-desktop/gbchcmhmhahfdphkhkmpfmihenigjmpp" target="blank_">Chrome Remote Desktop Web Store</a> and install it by clicking `Add to Chrome`.

__2.__ Click `Launch App` and the remote desktop app window should open.

## Install Chrome Remote Desktop Package

__1.__ You will now need to get the `.deb` for remote desktop with the following command in terminal:

```console
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
```

__2.__ Then install it by running:

```console
sudo apt install ./chrome-remote-desktop_current_amd64.deb
```

__3.__ If the initial installation attempt will fail, simply run `sudo apt install -f` to fix the missing dependencies and to complete the installation.

```console
sudo apt-get install -f
```
    
__4.__ You will need to add yourself to the chrome-remote-desktop group then reboot for the changes to take effect.

```console
sudo usermod -a -G chrome-remote-desktop $USER
sudo reboot
```
## Create Session File

__1.__ You will need to create a remote desktop session file in your home directory:

```console
gedit ~/.chrome-remote-desktop-session
```

__2.__ Look in `/usr/share/xsessions/` for the .desktop file for your linux environment. For example, ElementaryOS has a file named `Pantheon` with the following command: `gnome-session --session=pantheon`.

__3.__ Within the `chrome-remote-desktop-session` file enter the following (make sure to use your respective distro .desktop file):

```
exec /usr/sbin/lightdm-session "gnome-session --session=pantheon"
```

__4.__ If running ElementayOS you will also need to add the following to the file:

```
DESKTOP_SESSION=pantheon
XDG_CURRENT_DESKTOP=Pantheon 
XDG_RUNTIME_DIR=/run/user/1000
```

__5.__ Save the file and close.

## Post-Install Configuration (Setting up Displays)

__1.__ Stop Chrome Remote Desktop:

```console
/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop
```

__2.__ Backup the original configuration:

```console
sudo cp /opt/google/chrome-remote-desktop/chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop.orig
```

__3.__ Edit the config (`chrome-remote-desktop`) file:

```console
gedit /opt/google/chrome-remote-desktop/chrome-remote-desktop
```
    
__4.__ Find `DEFAULT_SIZES` and update the remote desktop resolution. For example:
    
```
DEFAULT_SIZES = "2560x1440"
```

__5.__ For multiple displays you will need to enter in the resolution for each one:

```
DEFAULT_SIZES = "2560x1440,2560x1440,2560x1440"
```
    
__6.__ Determine your main display number (obtain it with `echo $DISPLAY` from terminal). Find `FIRST_X_DISPLAY_NUMBER` and set the `FIRST_X_DISPLAY_NUMBER` to the display number (Ubuntu 17.10 and lower: usually 0, Ubuntu 18.04: usually 1)

```console
echo $DISPLAY
```

```
FIRST_X_DISPLAY_NUMBER = 0
```
__7.__ Around line 425, within the definition for `get_unused_display_number()`, comment out sections that look for additional displays by adding `#` infront:

```
# while os.path.exists(X_LOCK_FILE_TEMPLATE % display):
#   display += 1
```
    
__8.__ Lastly, find `launch_session()` and comment out `launch_x_server()` and `launch_x_session()` within `launch_session()`. You will then add `display = self.get_unused_display_number()` and `self.child_env["DISPLAY"] = ":%d" % display` to the definition. The function definition should look like the following:
    
```
def launch_session(self, x_args):
    self._init_child_env()
    self._setup_pulseaudio()
    self._setup_gnubby()
    #self._launch_x_server(x_args)
    #self._launch_x_session()
    display = self.get_unused_display_number()
    self.child_env["DISPLAY"] = ":%d" % display
```

__9.__ Save and exit the editor. Start Chrome Remote Desktop:

```console
/opt/google/chrome-remote-desktop/chrome-remote-desktop --start
```

## Launch Remote Desktop

__1.__ Finally, head to <a href="https://remotedesktop.google.com/access/" target="_blank">Chrome Remote Web</a> and Click `TURN ON` to enable remote desktop access. Set the system name, set the remote desktop connection PIN and click `START`.

