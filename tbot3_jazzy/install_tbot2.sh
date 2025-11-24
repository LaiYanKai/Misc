#!/bin/bash
# assume Rpi 5, 4GB/8GB/16GB
set -exo pipefail

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

# Clone Rplidar
rm -rf $HOME/rplidar
mkdir -p $HOME/rplidar/src
cd $HOME/rplidar/src
git clone -b ros2 https://github.com/Slamtec/rplidar_ros.git

# Clone Turtle
rm -rf $HOME/turtlebot3_ws
mkdir -p $HOME/turtlebot3_ws/src
cd $HOME/turtlebot3_ws/src
git clone -b jazzy https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b jazzy https://github.com/ROBOTIS-GIT/ld08_driver.git
git clone -b jazzy https://github.com/ROBOTIS-GIT/coin_d4_driver
cd $HOME/turtlebot3_ws/src/turtlebot3
rm -r turtlebot3_cartographer turtlebot3_navigation2

# Copy the launch file for rplidar C1 into Turtle
cd $HOME/turtlebot3_ws/src/turtlebot3/turtlebot3_bringup/launch
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/tbot3_jazzy/robot_c1.launch.py

# Build Rplidar
cd $HOME/rplidar
source /opt/ros/jazzy/setup.bash
colcon build --symlink-install # --parallel-workers 2
source $HOME/rplidar/install/setup.bash

# Build Turtle
# source /opt/ros/jazzy/setup.bash
source $HOME/rplidar/install/setup.bash # underlay the rplidar packages
cd $HOME/turtlebot3_ws/
colcon build --symlink-install # --parallel-workers 2

# Rplidar Udev
chmod +x $HOME/rplidar/src/rplidar_ros/scripts/create_udev_rules.sh
source $HOME/rplidar/src/rplidar_ros/scripts/create_udev_rules.sh

# Turtle UDev (OpenCR)
source $HOME/turtlebot3_ws/install/setup.bash
sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger

# OpenCR Firmware
rm -rf $HOME/opencr_update
mkdir -p $HOME/opencr_update
cd $HOME/opencr_update
sudo dpkg --add-architecture armhf  
sudo apt update  
sudo apt install libc6:armhf -y
export OPENCR_PORT=/dev/ttyACM0  
export OPENCR_MODEL=burger
wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2   
tar -xvf opencr_update.tar.bz2
cd $HOME/opencr_update/opencr_update  
./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr  
cd $HOME
rm -rf $HOME/opencr_update

# copy variables into .bashrc
echo 'source ~/turtlebot3_ws/install/setup.bash' >> $HOME/.bashrc
echo 'export LDS_MODEL=LDS-03' >> $HOME/.bashrc # If using LDS-03 (not C1)
echo 'export TURTLEBOT3_MODEL=burger' >> $HOME/.bashrc
echo 'export ROS_DOMAIN_ID=1' >> $HOME/.bashrc
