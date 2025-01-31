# 1&emsp;Install Oracle VirtualBox 6.1 on Windows Host 
If you have Ubuntu 22.04 LTS on your system as a virtual machine or boot, ignore this section. About 200MB of Wi-Fi is required for this section. This course requires Ubuntu 22.04 because ROS2 Humble requires Ubuntu 22.04. The steps are meant for installing the VirtualBox virtual machine on a Windows 10 or 11 system.  The instructions are not meant for Apple users, although it may be similar.


1. Go to https://www.virtualbox.org/wiki/Download_Old_Builds_6_1 to download the VirtualBox device. If your PC is on Windows, click `Windows hosts`.
2. Open the installer and click `Yes` or `Next` until the installer completes. You may encounter some information about missing Python dependencies, which can be ignored.
3. If using Windows, search for and click `Core Isolation` in the start menu. Turn off `Memory Integrity`, and close the window.

   ![image](https://github.com/user-attachments/assets/8197320e-70aa-44f9-a53d-756035730bc6)

5. If using Windows, search for and click `Turn Windows features on or off` in the start menu. Look for and uncheck `Virtual Machine Platform`, click `OK`, and restart Windows.

   ![image](https://github.com/user-attachments/assets/f6c6c1b6-8eee-49d2-b215-4a3346179aab)

7. Proceed to the next section.
