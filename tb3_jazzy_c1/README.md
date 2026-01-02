# Turtlebot3 Burger
- ROS2 Jazzy
- Rplidar C1
- Raspberry Pi 5, 8GB
- Raspberry Pi Camera V3 (for redundant use)

# 1&emsp;Flash SD Card
1. Download RPi imager, install Ubuntu **Server 24.04** on Rpi 5.
2. Edit Custom OS settings before flashing:
    1. username and password (Custom OS settings), 
    2. wifi ssid and password, 
    3. and enable open-ssh before flashing.
3. Flash and wait for about 15 to 30 mins.

# 2&emsp;Wire up
1. Plug in the keyboard and monitor to Rpi.
2. Turn on the WiFi.
3. Plug in the DC power supply to DC jack on OpenCR board.
4. Turn on the robot (flick switch on OpenCR board, make sure DC supply on)
5. Wait for `Finished apt-news.service - Update APT News` to show on the robot's monitor, and then type in username and password to log in.

# 3&emsp;Setup Internet (Just in case)
Modify internet connection via netplan if required. This step can be skippied if the Wi-Fi is already set up.
1. Open network config.
    ```bash
    sudo nano /etc/netplan/50-cloud-init.yaml
    ```
2. Make sure the file looks like this, replace `WIFI_SSID` with wifi name, and `WIFI_PASSWORD` with password. Make sure to keep the quotes `"`. Take note of the spaces in the indents. 
    ```yaml
    network:
    version: 2
        ethernets:
        eth0:
            dhcp4: true
            optional: true
        wifis:
        wlan0:
            dhcp4: true
            optional: true
            access-points: 
            "WIFI_SSID":
                password: "WIFI_PASSWORD"
    ```
    If the Wifi name is `my wifi`, and the password is `1234`, then the last two lines are:
    ```yaml
    "my wifi":
      password: "1234"
    ```

3. `Ctrl+S` then `CTRL+X` to exit.

4. Run the following:
    ```bash
    sudo netplan apply
    ```
5. Wait for a while. Try to ping google.com to see if network is working:
    ```bash
    ping google.com
    ```

# 4&emsp;Install Software
1. Download scripts to install software
```bash
cd ~
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1/install_tbot.sh
```

2. Assign permissions and run the `install_tbot.sh` script. The robot will reboot very shortly. Wait for it to restart.
```bash
cd ~
chmod +x *.sh
./install_tbot.sh
```

3. Once rebooted, log in, and then run `install_tbot2.sh`.
    1. Run:
        ```bash
        ./install_tbot2.sh
        ```
    2. Key in the password when prompted.
    3. Press `ENTER` when prompted, shortly after the script is run.
    4. Wait for about half an hour, depending on the download speed.
    5. The installation will occasionally fail if the internet connection is not stable. Contact me if the installation fails halfway.

4. Once completed, it will prompt to run `install_tbot3.sh`. 
    - If not completed (i.e. prompt does not show) and the control returns, the script may have run wrongly. `install_tbot2.sh` may have to be re-run **from the correct line of code** if it fails.
    - If completed, run with
        ```bash
        ./install_tbot3.sh
        ```

5. Shutdown when complete
    ```bash
    sudo shutdown now
    ```