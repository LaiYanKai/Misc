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
sudo apt install ros-jazzy-ros-base ros-dev-tools python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential ros-jazzy-hls-lfcd-lds-driver ros-jazzy-turtlebot3-msgs ros-jazzy-dynamixel-sdk ros-jazzy-xacro libudev-dev openssh-server python3-colcon-meson python3-ply python3-pip -y # python3-colcon-meson and python3-ply for camera
echo 'source /opt/ros/jazzy/setup.bash' >> $HOME/.bashrc
sudo rosdep init
rosdep update

# Install ultralytics
# pip install ultralytics --break-system-packages # --no-deps

# Clone Rplidar
rm -rf $HOME/rplidar_ws
mkdir -p $HOME/rplidar_ws/src
cd $HOME/rplidar_ws/src
git clone -b ros2 https://github.com/Slamtec/rplidar_ros.git

# Apply 15cm to 5cm min lidar range (quick hack. range may not be accurate when <0.1m)
cd $HOME/rplidar_ws/src/rplidar_ros/src
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1_cam3/rplidar_node.cpp

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
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1_cam3/robot_c1_cam3.launch.py

# Camera libs
mkdir -p $HOME/camera_ws/src
cd $HOME/camera_ws/src
git clone https://github.com/raspberrypi/libcamera.git # worked at 24 Nov 2025
git clone https://github.com/christianrauch/camera_ros.git # worked at 24 Nov 2025

# Begin building from ROS (Underlay)
source /opt/ros/jazzy/setup.bash

# Install and Build Camera Libs
cd $HOME/camera_ws/
rosdep install -y --from-paths src --ignore-src --rosdistro jazzy --skip-keys=libcamera
colcon build # --event-handlers=console_direct+

# Build Rplidar
cd $HOME/rplidar_ws/
colcon build --symlink-install # --parallel-workers 2

# Build Turtle
# source /opt/ros/jazzy/setup.bash
source $HOME/rplidar_ws/install/setup.bash # underlay the rplidar packages
source $HOME/camera_ws/install/setup.bash # underlay the camera packages
cd $HOME/turtlebot3_ws/
colcon build --symlink-install # --parallel-workers 2

echo "Raspberry Pi Git Repo prevented camera_ros from working on Rpi Cam V3 from late Nov 2025. Correct as of 5 Dec."
echo "Run ./install_tbot3.sh manually"