3&emsp;Installing Ubuntu 24.04
==============
Install Ubuntu 24.04.

# Table of Contents

[3.1&emsp;Installation Steps](#31installation-steps)

[3.2&emsp;Initial Boot](#32initial-boot)

[3.3&emsp;VirtualBox Guest Additions](#33virtualbox-guest-additions)


# 3.1&emsp;Installation Steps

| | |
| -- | -- |
| Summary | Steps to install Ubuntu 24.04 on its installer. | 
| Who? | These instructions are for all users (dual boot, single boot, VirtualBox). There will be slight differences in the instructions for different users. |
| Reference | The instructions are based on https://ubuntu.com/tutorials/install-ubuntu-desktop. |


1. Select `Try or Install Ubuntu` and press `Enter`.

    ![](img/rb101.png)

    Other options may be seen by dual boot or single boot users.

2. Select `English` and click `Next`.

    ![](img/rb102.png)

3. Select Accessibility settings if required. Click `Next`.

4. Select your keyboard. The default `English (US)` works for Singaporeans. Click `Next`.

    ![](img/rb104.png)

5. Connect to the internet. For VirtualBox users, only the `Wired Connection` is available. Click `Next`.

    ![](img/rb105.png)

6. Skip the installer update by clicking `Next`.

    ![](img/rb106.png)

7. Click `Install Ubuntu` and `Next`.

    ![](img/rb107.png)

8. Click `Interactive Installation` and `Next`.

    ![](img/rb108.png)

9. Click `Default Selection` and `Next`.

    ![](img/rb109.png)

10. Select `Install third-party software for graphics and Wi-Fi hardware`. If selectable, select `Download and install support for additional media formats`. Click `Next`.

    ![](img/rb110.png)

11. Select the installation type. You may refer to https://ubuntu.com/tutorials/install-ubuntu-desktop#6-type-of-installation for more details.

    - For **dual boot** and **single boot** users, you may encounter a Bitlocker alert if there is an existing Windows 11 installation. Follow the instructions on https://ubuntu.com/tutorials/install-ubuntu-desktop#13-additional-installing-ubuntu-alongside-windows-with-bitlocker to disable Bitlocker, and continue from step 5 (accessing the boot menu) of [2.1 Single Boot and Dual Boot](02_Getting_Ubuntu.md#21single-boot-and-dual-boot)

    - For **dual boot** users, select `Install Ubuntu alongside another operating system`. Click `Next`. You will then be prompted to select the size of the partition. 
    Select at least 30GB for this course, or at least 100GB for long-term use.

    - For **single boot** users and **VirtualBox** users `Erase disk and install Ubuntu`. Click `Next`.


12. Create an account and password. Unchecking `Require my password to log in` boots you directly onto your desktop without manual input. If your computer is woken up from sleep or blank screen, the password is still required. Click `Next`.

    ![](img/rb112.png)

13. Select `Singapore` or your location for accurate time and date. Click `Next`.

    ![](img/rb113.png)

14. Click `Install`. (Note the choices in the picture below are based on VirtualBox install and `Erase disk`. The selection will be different for single boot and dual boot.)

    ![](img/rb114.png)

15. Wait for at least 10 minutes, around 20 minutes, while installation proceeds. Only about 30MB of data may be used if proprietary software is downloaded.

16. Once installation completes, click `Restart Now`.

    ![](img/rb116.png)

17. Wait for a moment. For single boot and dual boot, remove the USB stick. For VirtualBox users, there is nothing to remove. Press `Enter` to continue.

    ![](img/rb117.png)

18. Proceed to the next section.

# 3.2&emsp;Initial Boot

| | |
| -- | -- |
| Summary | Preliminary setups for the first boot after installing Ubuntu: the welcome dialog, icon removal, and disabling screen blanks. | 

1. Once booted into Ubuntu for the first time, click `Next` on the welcome window.

    ![](img/rb118.png)

2. Select `Skip for now` for Ubuntu Pro and click `Skip`.

    ![](img/rb119.png)

3. Choose to share or not share system data. Click `Next`.

    ![](img/rb120.png)

4. Click `Finish`.

    ![](img/rb121.png)

22. You may choose to remove unwanted icons from the dock by right-clicking them and selecting `Unpin`. This will help to clear up space if the screen is very small, particularly over remote connections or VirtualBox. Only the `Firefox`, `Files` and `Trash` icons are needed. There may be unremovable icons like the hard disks.

    ![](img/rb122.png)

23. Disable screen blank if needed. The screen turning off can become an inconvenience if coding for long periods of time.

    1. Click the top-left icon, search for `power`, and select `Power`.

        ![](img/rb123a.png)

    2. Change `Screen Blank` to `Never`.

        ![](img/rb123b.png)

24. For dual boot and single boot users, proceed to to install software starting from [4.1 Terminator](04_Installing_Ubuntu_Software.md#41terminator). For VirtualBox users, proceed to the next section to install Guest Additions.

# 3.3&emsp;VirtualBox Guest Additions
| | |
| -- | -- |
| Summary | Guest Additions allow users to cut-and-paste text from the host operating system to Ubuntu, and other useful interactions between the host and virtual operating systems. | 
| Reference | Adapted from https://linuxconfig.org/installing-virtualbox-guest-additions-on-ubuntu-24-04. |


1. Open a terminal with `Ctrl+Alt+T`.
2. Run:
    ```bash
    sudo apt update
    ```
    - Ensure that one-line commands are one line and not split across multiple lines. 
    - If there are errors, do not continue the commands, and troubleshoot the problems.
    - You may be prompted to key in the password for `sudo` commands every 15 minutes.
3. Run:
    ```bash
    sudo apt install build-essential dkms linux-headers-$(uname -r) -y
    ```
4. On the virtual machine window, click `Devices`, and select `Insert Guest Additions CD image...`.

    ![](img/rb130.png)

5. Once mounted, a CD icon will appear. We will now run the script.
    1. Open `Files`.
    2. Click the `VBox_GAs...` on the left pane of the window.
    3. Right-click `autorun.sh`, and `Run as a Program`.

    ![](img/rb131.png)

6. Key in the password and click `Authenticate`.
    
    ![](img/rb132.png)

7. A new terminal will open for the installation. Once complete, press `Enter` to close the window.
    
    ![](img/rb133.png)

8. Reboot the system. On the previous terminal, run the following to reboot the computer. You may be prompted to key in the password.
    ```bash
    sudo reboot
    ```

9. On the virtual machine window, select `Devices`, `Shared Clipboard`, and `Bidirectional`. You should now be able to cut and paste text from the host operating system to the virtual Ubuntu 24.04.

    ![](img/rb134.png)

10. Proceed to to install software starting from [4.1 Terminator](04_Installing_Ubuntu_Software.md#41terminator).
