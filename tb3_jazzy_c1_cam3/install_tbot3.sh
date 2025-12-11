#!/bin/bash
# assume Rpi 5, 4GB/8GB/16GB
set -exo pipefail

# Rplidar Udev
source $HOME/rplidar_ws/install/setup.bash
chmod +x $HOME/rplidar_ws/src/rplidar_ros/scripts/create_udev_rules.sh
source $HOME/rplidar_ws/src/rplidar_ros/scripts/create_udev_rules.sh

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