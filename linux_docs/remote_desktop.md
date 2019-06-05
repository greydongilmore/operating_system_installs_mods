# Google Remote Desktop

## Install Remote Desktop

1. Navigate to [Chrome Remote Desktop Web Store](https://chrome.google.com/webstore/detail/chrome-remote-desktop/gbchcmhmhahfdphkhkmpfmihenigjmpp) and install it by clicking `Add to Chrome`.

2. Click `Launch App` and the remote desktop app window should open.

3. Select `Remote Assistance — Get started`, then `Share`, and `Accept and Install`. Do not click the `Download … Host Installer` yet.

4. In a separate terminal window, install the Debian package from its download location. The initial installation attempt will fail, simply run `sudo apt-get install -f` to fix the missing dependencies and to complete the installation.

    ```console
    sudo dpkg -i ~/Downloads/chrome-remote-desktop_current_amd64.deb
    ```

    ```console
    sudo apt-get install -f
    ```
    
5. You will need to add yourself to the chrome-remote-desktop group then reboot for the changes to take effect.

    ```console
    sudo usermod -a -G chrome-remote-desktop $USER
    sudo reboot
    ```

## Post-Install Configuration

1. Stop Chrome Remote Desktop:

    ```console
    /opt/google/chrome-remote-desktop/chrome-remote-desktop --stop
    ```

2. Backup the original configuration:

    ```console
    sudo cp /opt/google/chrome-remote-desktop/chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop.orig
    ```

3. Edit the config (`chrome-remote-desktop`) file:

    ```console
    vi /opt/google/chrome-remote-desktop/chrome-remote-desktop
    ```
    
    a. Find `DEFAULT_SIZES` and update to the remote desktop resolution. For example:
    
        ```
        DEFAULT_SIZES = "1920x1080"
        ```
    
    b. `FIRST_X_DISPLAY_NUMBER`: determine main display number (obtain it with `echo $DISPLAY` from terminal) and set the `FIRST_X_DISPLAY_NUMBER` to the display number (Ubuntu 17.10 and lower: usually 0, Ubuntu 18.04: usually 1)
        
        ```console
        echo $DISPLAY
        ```
        
        ```
        FIRST_X_DISPLAY_NUMBER = 0
        ```
    c. Comment out sections that look for additional displays:

        ```
        #while os.path.exists(X_LOCK_FILE_TEMPLATE % display):
        #  display += 1
        ```
    
    d. `launch_session()`: reuse the existing X session (instead of launching new one) by commenting out `launch_x_server()` and `launch_x_session()` within `launch_session()`. The function definition should look like the following:
    
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

4. Save and exit the editor. Start Chrome Remote Desktop:

    ```console
    /opt/google/chrome-remote-desktop/chrome-remote-desktop --start
    ```

## Launch Remote Desktop

1. Launch Chrome Remote Desktop, you will notice that the `Enable remote connections` button was enabled. Click it and enter a PIN.

