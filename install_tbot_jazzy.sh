#!/bin/bash
# assume Rpi 5, 4GB/8GB/16GB
set -exo pipefail

# ==========================
# # netplan
# # sudo sh -c "echo 'network:' > /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '  version: 2' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '  ethernets:' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '    eth0:' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      optional: true' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '  wifis:' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '    wlan0:' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      optional: true' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      access-points: ' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '        "$1": ' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '          password: "$2"' >> /etc/netplan/50-cloud-init.yaml"
# # echo 'Run sudo nano /etc/netplan/50-cloud-init.yaml and change the <WIFI_SSID> and <WIFI_PASSWORD>. If password is 1234, replace <WIFI_PASSWORD> with "1234", including quotes. If SSID is mallab16, replace <WIFI_SSID> with "mallab16", including quotes.'

# # auto upgrades
# sudo sed -i 's/"1"/"0"/g' /etc/apt/apt.conf.d/20auto-upgrades

# # will require authentication
# systemctl mask systemd-networkd-wait-online.service
# sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# # for Desktop versions only
# gsettings set org.gnome.desktop.screensaver lock-enabled false

# # get next script
# wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/install_tbot_humble2.sh

# chmod +x *.sh

# # create swap memory if using 2GB rpi
# # sudo swapoff /swapfile
# sudo fallocate -l 4G /swapfile
# sudo chmod 600 /swapfile
# sudo mkswap /swapfile
# sudo swapon /swapfile
# # sudo nano /etc/fstab
# sudo sh -c "echo '/swapfile swap swap defaults 0 0' >> /etc/fstab"

# sudo reboot

# ========================

# Install ROS2 Jazzy below
sudo apt install software-properties-common -y
sudo add-apt-repository universe
sudo apt update
sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb
sudo apt update 
sudo apt upgrade -y
sudo apt install ros-jazzy-ros-base ros-dev-tools python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential ros-jazzy-hls-lfcd-lds-driver ros-jazzy-turtlebot3-msgs ros-jazzy-dynamixel-sdk ros-jazzy-xacro libudev-dev openssh-server -y
echo 'source /opt/ros/jazzy/setup.bash' >> $HOME/.bashrc

# Clone Turtle
mkdir -p $HOME/turtlebot3_ws/src
cd $HOME/turtlebot3_ws/src
git clone -b jazzy https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b jazzy https://github.com/ROBOTIS-GIT/ld08_driver.git
git clone -b jazzy https://github.com/ROBOTIS-GIT/coin_d4_driver
cd $HOME/turtlebot3_ws/src/turtlebot3
rm -r turtlebot3_cartographer turtlebot3_navigation2

# Build Turtle
cd $HOME/turtlebot3_ws/
source /opt/ros/jazzy/setup.bash
colcon build --symlink-install # --parallel-workers 2
echo 'source ~/turtlebot3_ws/install/setup.bash' >> $HOME/.bashrc
echo 'export LDS_MODEL=LDS-03' >> $HOME/.bashrc # If using LDS-03 (not C1)

# Turtle UDev (OpenCR)
sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger

# Clone Rplidar
mkdir -p $HOME/rplidar/src
cd $HOME/rplidar/src
git clone -b ros2 https://github.com/Slamtec/rplidar_ros.git

# Build Rplidar
cd $HOME/rplidar
# source /opt/ros/jazzy/setup.bash
colcon build --symlink-install # --parallel-workers 2
source $HOME/rplidar/install/setup.bash
echo 'source ~/rplidar/install/setup.bash' >> $HOME/.bashrc

# Rplidar Udev
source $HOME/rplidar/src/rplidar_ros/scripts/create_udev_rules.sh

# cd $HOME/turtlebot3_ws/src/turtlebot3/turtlebot3_bringup/launch
# wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/robot_c1.launch.py
# cd $HOME/turtlebot3_ws
# colcon build --symlink-install --parallel-workers 2
# echo 'source ~/turtlebot3_ws/install/setup.bash' >> $HOME/.bashrc

# OpenCR Firmware
mkdir -p $HOME/opencr_update
cd $HOME/opencr_update
sudo dpkg --add-architecture armhf  
sudo apt-get update  
sudo apt-get install libc6:armhf -y
export OPENCR_PORT=/dev/ttyACM0  
export OPENCR_MODEL=burger
rm -rf ./opencr_update.tar.bz2 
wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2   
tar -xvf opencr_update.tar.bz2
./opencr_update  
./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr  
cd $HOME
rm -rf $HOME/opencr_update

# ROS_DOMAIN_ID
echo 'export ROS_DOMAIN_ID=1' >> $HOME/.bashrc