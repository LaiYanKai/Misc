# Turtlebot3 Burger
- ROS2 Jazzy
- Rplidar C1
- Raspberry Pi 5 
- Raspberry Pi Camera V3

# 1&emsp;Flash SD Card
1. Download RPi imager, install Ubuntu **Server 24.04**.
2. Set the username and password before flashing.
3. Flash and wait for about 30 mins.

# 2&emsp;Wire up
1. Plug in the keyboard and monitor to Rpi.
2. Plug in the DC power supply to DC jack on OpenCR board.
3. Turn on the robot (flick switch on OpenCR board, make sure DC supply on)
4. Log in once the robot has booted up.

# 3&emsp;Setup Internet
Enable internet connection via netplan.
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
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1_cam3/install_tbot.sh
```

2. Assign permissions and run:
    1. Press `ENTER` when prompted a short while after the script runs.
    2. Robot will reboot very shortly. Wait for it to restart.
```bash
cd ~
chmod +x *.sh
./install_tbot.sh
```

3. Once rebooted, log in and run the following. Wait for about an hour.
```bash
./install_tbot2.sh
```

4. Take note of any errors, let me know. If successful, shutdown:
```bash
sudo shutdown now
```