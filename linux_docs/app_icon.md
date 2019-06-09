# Adding application launch icon to favorites
1. Download your own icon image
2. Find path to the executable of your application by running (replace brackets with name of applicaion):

      ```console
      which [name_application]
      ```
Copy the path from this output.

3. Create\edit the `.desktop` file for the application by running the command (remember to edit the application name):

      ```console
      gedit Desktop/[name_application].desktop
      ```
      
4. Add the following lines (replace the items in square brackets with your respect application) and save the file with the extension `.desktop` (e.g. `[application name].desktop`):

      ```
      #!/usr/bin/env xdg-open

      [Desktop Entry]
      Type=Application
      Icon=[path_to_icon_file]
      Name=[Name your application]
      Comment=[Name your application]
      Exec=[path_to_executable file_from_step2]
      Categories=Development
      ```

5. Right click on the file (should now be on your desktop), select properties, then permissions and select `Allow executing file as program`

6. Finally, move this file to the desktop launcher path on your system:

      ```console
      sudo mv /Desktop/*[name_of_file]* /usr/share/applications/
      ```
