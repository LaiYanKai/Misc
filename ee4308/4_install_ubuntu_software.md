# 4&emsp;Configure and Install Ubuntu Software (ROS)
## 4.1&emsp;First-time Configurations

1. Click `Skip`, `Next`, `Next`, `Next`, `Done` on the new window to close it.

    ![image](https://github.com/user-attachments/assets/3ad8c967-2f36-4a46-aa58-9349fa3d67a0)

2. **Optional**. The icons on the dock can be removed to de-clutter the workspace. Right-click the icons to `Remove from Favorites` until `Files`, `Firefox`, and `Trash` are left.

    ![image](https://github.com/user-attachments/assets/0b1c33a1-191a-49f0-ad67-54ed21ccd5c8)

3. **Optional**. Disable screen blank. Go to `Activities`, search for and click `Power` under `Settings`, and select `Never` for `Screen Blank`. This helps to prevent screen blanks when troubleshooting the code. Close the window when done.

    ![image](https://github.com/user-attachments/assets/444de811-11f2-4229-945d-138a04758de2)

4. For the following dialog boxes, reject all updates and upgrades (Select `OK` for the decline to upgrade to 24.04). Reject them agan if they re-appear in subsequent boots.
   
    ![image](https://github.com/user-attachments/assets/9e158a9e-4661-49ef-9b29-e8bbb620dccc)


   
## 4.2&emsp;Install Terminator

1. Open a new terminal with `Ctrl+Alt+T`, and run:

   ```bash
   sudo apt install terminator -y
   ```

   Key in the password. This is the password that was set when Ubuntu was installed. There will not be any visible feedback on the terminal when characters are typed. Press `Enter` after the password is typed.

2. Close the terminal (`Ctrl+D`) and launch a new terminal with `Ctrl+Alt+T`. Terminator should now be launched, distinguishable by the red bar. It will now be called the "terminal".

3. On the black space of the terminal, right-click and click `Preferences`. Go to `Profiles`, `Scrolling`, and select `Infinite Scrollback`. This is useful for troubleshooting printed statements.

    ![image](https://github.com/user-attachments/assets/7fbb37a2-abd1-4c4e-8ff2-09dd96ac595a)

4. Useful shortcuts for using Terminator are:
    - `Ctrl+Shift+O` opens a new terminal below the active terminal.
    - `Ctrl+Shift+E` opens a new terminal to the right of the active terminal.
    - `Ctrl+Shift+W` closes the active terminal.
    - `Ctrl+Shift+C` copies the selected text.
    - `Ctrl+Shift+V` pastes text.

## 4.3&emsp;Upgrade and Install ROS2 
This installation is meant for **freshly installed** Ubuntu. There are configurations labeled as `[OPTIONAL]` in `humble_install.sh` that you may need to investigate if using an existing Ubuntu installation.

1. In a terminal, download the installation script and assign permissions. The script is used for installing the lab computers.

    ```bash
    cd ~
    wget https://raw.githubusercontent.com/laiyankai/misc/main/humble_install.sh
    chmod +x humble_install.sh
    ```

2. Run the script
   ```bash
   cd ~
   ./humble_install.sh
   ```
   
3. Key in the password. There may be additional step to key in the password for a `sudo` command, and an extra step to press `Enter` for another command.

    ![image](https://github.com/user-attachments/assets/a5cdcfe0-d119-43e7-b66a-ed1b83eee4f9)

4. Wait between a few minutes to half an hour.  If the installation does not stop at `+sudo set -i...` there may be errors. Ensure that there is internet connection and retry the script from step 2. 

   ![image](https://github.com/user-attachments/assets/00432839-2c5b-479e-9ef5-fec40da94f14)

   
5. Once the installation is complete, load up Gazebo on a map that will be used by the course. Gazebo will take a few minutes (up to 10 minutes) to load a map for the first time, during which a black screen will be shown in Gazebo. If a pop-up dialog indicates that Gazebo is not responding, click `Wait`. 

    ![image](https://github.com/user-attachments/assets/15d756c2-74ca-4e32-b5e6-af7891c364f4)

   After loading is complete, the environment can be seen in Gazebo. `Ctrl+C` at the terminal to close Gazebo.

    ![image](https://github.com/user-attachments/assets/47e6e261-d387-4141-8288-d8a13ecdbf0c)


## 4.4&emsp; Install VirtualBox Guest Additions

1.  For VirtualBox users only, to enable shared clipboard between the host and Ubuntu 22.04. On the virtual machine window, select `Devices`, and `Insert Guest Additions CD Image`.

    ![image](https://github.com/user-attachments/assets/a7a41e81-2824-45c9-8b63-79b9add675c7)

2. In a terminal in Ubuntu 22.04, run the installer with (press `Tab` to autocomplete commands where possible):

    ```bash
    cd /media/$(whoami)/VBox_GAs_6.1.50/
    sudo ./VBoxLinuxAdditions.run
    ```

    A successful installation will prompt a reboot:
   
    ![image](https://github.com/user-attachments/assets/5630d847-2b5f-4e33-ab01-8ca7eaaaf042)
    

4. Reboot the system with `sudo reboot now`, or clicking `Power Off / Log Out` and `Restart...` from the menu at the top-right hand corner of the screen.

5. Right-click the CD icon on the Dock and `Eject`.

    ![image](https://github.com/user-attachments/assets/77bf0f74-c63e-45ae-8256-ccdfb82f5999)

6. You should now be able to copy text from the Host (Windows) to Ubuntu, and vice-versa.

## 4.5&emsp;Install Visual Studio Code (vscode)

1. Go to `Activities`, and search for and click `Ubuntu Software`.

    ![image](https://github.com/user-attachments/assets/8c1c2f05-f74c-42da-9997-82e8df1b6eab)

2. Click the search icon, and search for `vscode`. Click the `code` software (Visual Studio Code).

    ![image](https://github.com/user-attachments/assets/bf53080f-119c-4c8d-9267-2444655f2c79)

3. Click `Install`, and key in the password. When the installation is complete, close the Ubuntu Software window.

4. Go to `Activities`, and search for `vscode`, and open the software.

    ![image](https://github.com/user-attachments/assets/32a599e7-d8f6-411d-a0a6-35ccf1a13d3c)

5. Key in a password for the login key ring, which can be the same as the default. Click `Continue`.

    ![image](https://github.com/user-attachments/assets/68d6ce8c-a505-4c24-b17d-c10b1df1afb1)

6. Go to `Extensions`, search for `ROS`, and install the `ROS` extension by Microsoft.

    ![image](https://github.com/user-attachments/assets/ac9c0e3a-9695-483e-b0ab-099a9955f952)

7. Search for the `C/C++ Extension Pack` by Microsoft and install it.

    ![image](https://github.com/user-attachments/assets/bbc228d1-e931-49d2-ae24-72538079b9e9)

8. The color theme can be changed by going to preferences `Ctrl+,` and searching for `theme`.
